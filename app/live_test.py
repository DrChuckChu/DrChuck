import cv2
import mediapipe as mp
import numpy as np
import math
import pandas as pd
from PIL import ImageFont, ImageDraw, Image
import pickle

import sys, os
# 파일 경로 절대경로로 설정(?)
sys.path.append(os.path.dirname(os.path.abspath(os.path.dirname(__file__))))

from calculation import cal

mp_drawing = mp.solutions.drawing_utils
mp_pose = mp.solutions.pose
mp_holistic = mp.solutions.holistic
mp_drawing_styles = mp.solutions.drawing_styles

# 모델 객체 가져오기
with open('../models/rf_model.pkl', 'rb') as f:
    model = pickle.load(f)

cap = cv2.VideoCapture(0)

w = cap.get(cv2.CAP_PROP_FRAME_WIDTH)
h = cap.get(cv2.CAP_PROP_FRAME_HEIGHT)

with mp_holistic.Holistic(min_detection_confidence=0.5, min_tracking_confidence=0.5) as holistic:
    

    while cap.isOpened():
        values_lst = []

        ret, frame = cap.read()

        if not ret:
            break
        
        # Recolor Feed
        image = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
        image.flags.writeable = False        
        
        # Make Detections
        results = holistic.process(image)
        # print(results.face_landmarks)
        
        try:
            p_landmarks = results.pose_landmarks
            f_landmarks = results.face_landmarks

            # 어깨 좌표
            left_shoulder = cal.get_coordinate(p_landmarks.landmark[11], w, h)
            right_shoulder = cal.get_coordinate(p_landmarks.landmark[12], w, h)

            # 귀 좌표
            left_ear = cal.get_coordinate(p_landmarks.landmark[7], w, h)
            right_ear = cal.get_coordinate(p_landmarks.landmark[8], w, h)


            # 턱좌표 랜드마크 인덱스 152
            tuck = f_landmarks.landmark[152]
            tuck_point = cal.get_coordinate(tuck, w, h)
            # print('(x, y) : ', tuck_point)

            # 이마 좌표 인덱스 10
            ima = f_landmarks.landmark[10]
            ima_point = cal.get_coordinate(ima, w, h)

            # 어깨 사이 각
            shoulder_angle = cal.cal_angle(right_shoulder, left_shoulder)
            # print('shoulder angle : ', shoulder_angle)
            values_lst.append(shoulder_angle)

            # 귀 사이 각
            ear_angle = cal.cal_angle(right_ear, left_ear)
            # print('ear angle : ', ear_angle)
            values_lst.append(ear_angle)

            # 어깨 선 기울기 
            shoulder_slope = cal.get_slope(left_shoulder, right_shoulder)
            # print(shoulder_slope)
            # 어깨 직선 절편
            b = left_shoulder[1] - shoulder_slope*left_shoulder[0]
            # print(b)

            # 턱-어깨선 사이의 거리
            turtle_dis = cal.get_dis(tuck_point, -shoulder_slope, 1, -b)
            # print(turtle_dis)
            values_lst.append(turtle_dis)

            # 이마-턱 사이의 거리
            face_dis = cal.calculate_distance(ima_point, tuck_point)
            # print(face_dis)
            values_lst.append(face_dis)

            values_lst = values_lst + [False, True] # T/F는 성별값 임시로 넣어 놓은 것, 나중에 Spring에서 받아온 값 넣어야함

            X = pd.DataFrame(data=[values_lst], columns=['shoulder_angle_lst', 'ear_angle_lst', 'turtle_dis_lst', 'face_dis_lst', 'gender_F', 'gender_M'])
            class_pred = model.predict(X)[0]

            # Recolor image back to BGR for rendering
            image.flags.writeable = True   
            image = cv2.cvtColor(image, cv2.COLOR_RGB2BGR)
            
            
            # # 1. Draw face landmarks
            # mp_drawing.draw_landmarks(image, results.face_landmarks, mp_holistic.FACEMESH_CONTOURS, 
            #                         mp_drawing.DrawingSpec(color=(80,110,10), thickness=1, circle_radius=1),
            #                         mp_drawing.DrawingSpec(color=(80,256,121), thickness=1, circle_radius=1)
            #                         )
            
            # # 2. Right hand
            # mp_drawing.draw_landmarks(image, results.right_hand_landmarks, mp_holistic.HAND_CONNECTIONS, 
            #                         mp_drawing.DrawingSpec(color=(80,22,10), thickness=2, circle_radius=4),
            #                         mp_drawing.DrawingSpec(color=(80,44,121), thickness=2, circle_radius=2)
            #                         )

            # # 3. Left Hand
            # mp_drawing.draw_landmarks(image, results.left_hand_landmarks, mp_holistic.HAND_CONNECTIONS, 
            #                         mp_drawing.DrawingSpec(color=(121,22,76), thickness=2, circle_radius=4),
            #                         mp_drawing.DrawingSpec(color=(121,44,250), thickness=2, circle_radius=2)
            #                         )


            # dst = np.full((500, 500, 3), 255, np.unit8)
                
            if class_pred == 'Good':
                dst = cv2.copyMakeBorder(image, 5, 5, 5, 5, cv2.BORDER_CONSTANT, value=[0,255,0])
                dst = cv2.flip(dst, 1)

                text = '조아쒀~!'
                dst_pill = Image.fromarray(dst)
                font = ImageFont.truetype('../font/NPSfont_bold.ttf',40)
                draw = ImageDraw.Draw(dst_pill)
                draw.text((460, 30),text,(0,150,0),font=font)

                dst_final = np.array(dst_pill)


            elif class_pred == 'Bad':
                dst = cv2.copyMakeBorder(image, 5, 5, 5, 5, cv2.BORDER_CONSTANT, value=[0,0,255])
                dst = cv2.flip(dst, 1)

                text = '나빠쒀~!'
                dst_pill = Image.fromarray(dst)
                font = ImageFont.truetype('../font/NPSfont_bold.ttf',40)
                draw = ImageDraw.Draw(dst_pill)
                draw.text((460, 30),text,(0,0,150),font=font)

                dst_final = np.array(dst_pill)


            elif class_pred == 'Turtle':
                dst = cv2.copyMakeBorder(image, 5, 5, 5, 5, cv2.BORDER_CONSTANT, value=[255,0,0])
                dst = cv2.flip(dst, 1)
                
                text = '거북거북'
                dst_pill = Image.fromarray(dst)
                font = ImageFont.truetype('../font/NPSfont_bold.ttf',40)
                draw = ImageDraw.Draw(dst_pill)
                draw.text((460, 30),text,(128,0,0),font=font)

                dst_final = np.array(dst_pill)


            print(class_pred)


            # cv2.imshow('Test Live', cv2.flip(image, 1))
            cv2.imshow('dst', dst_final)


            if cv2.waitKey(10) & 0xFF == ord('q'):
                break
            
        except:
            pass

cap.release()
cv2.destroyAllWindows()