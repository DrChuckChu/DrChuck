import cv2
import mediapipe as mp
import numpy as np
import matplotlib.pyplot as plt
from PIL import ImageFont, ImageDraw, Image
import pandas as pd
import pickle
import threading
import json

import sys, os
# 파일 경로 절대경로로 설정(?)
sys.path.append(os.path.dirname(os.path.abspath(os.path.dirname(__file__))))

from app import dao
from calculation import cal

mp_drawing = mp.solutions.drawing_utils
mp_pose = mp.solutions.pose
mp_holistic = mp.solutions.holistic
mp_drawing_styles = mp.solutions.drawing_styles

# 열린 캠에 모델 적용해서 .jpg로 인코딩하는 함수
def gen_frames(camera, get_session):  
    # 모델 객체 가져오기
    with open('./models/rf_model.pkl', 'rb') as f:
        model = pickle.load(f)
    
    id = get_session['id']
    gender = get_session['gender']

    w = camera.get(cv2.CAP_PROP_FRAME_WIDTH)
    h = camera.get(cv2.CAP_PROP_FRAME_HEIGHT)

    with mp_holistic.Holistic(min_detection_confidence=0.5, min_tracking_confidence=0.5) as holistic:
        

        cnt_exist = 0 # 사람이 있을 때 카운트
        cnt_none = 0 # 사람이 없을 때 카운트
        threshold = 60 # 사용자 얼굴크기의 임계값
        while camera.isOpened():

            values_lst = []

            ret, frame = camera.read()

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

                # 성별 
                if gender == 'M':
                    val_dict_lst = [{
                        'shoulder_angle' : values_lst[0],
                        'ear_angle' : values_lst[1],
                        'turtle_dis' : values_lst[2],
                        'face_dis' : values_lst[3],
                        'gender' : gender
                    }]
                    values_lst = values_lst + [False, True]
                elif gender == 'F':
                    val_dict_lst = [{
                        'shoulder_angle' : values_lst[0],
                        'ear_angle' : values_lst[1],
                        'turtle_dis' : values_lst[2],
                        'face_dis' : values_lst[3],
                        'gender' : gender
                    }]
                    values_lst = values_lst + [True, False]
                else :
                    print('이상한 성별!!')

                X = pd.DataFrame(data=[values_lst], columns=['shoulder_angle_lst', 'ear_angle_lst', 'turtle_dis_lst', 'face_dis_lst', 'gender_F', 'gender_M'])
                class_pred = model.predict(X)[0]

                # 결과확인
                # print(class_pred)
                cnt_exist += 1
                
                # Recolor image back to BGR for rendering
                image.flags.writeable = True   
                image = cv2.cvtColor(image, cv2.COLOR_RGB2BGR)
                
                # 모델 결과별
                if class_pred == 'Good':
                    border_color = (0,204,0)
                    word_color = (0,204,0)
                    text = 'Good'

                elif class_pred == 'Bad':
                    border_color = (51,51,255)
                    word_color = (51,51,255)
                    text = 'Bad'

                elif class_pred == 'Turtle':
                    border_color = (255,154,51)
                    word_color = (255,154,51)
                    text = '거북목'

                # 사용자 얼굴크기기반 거리
                if face_dis <= threshold: 
                    dst = cv2.copyMakeBorder(image, 5, 5, 5, 5, cv2.BORDER_CONSTANT, value=(255,255,255))
                    dst = cv2.blur(dst, (25,25))
                    dst = cv2.flip(dst, 1)
                    text = ''
                else:
                    dst = cv2.copyMakeBorder(image, 5, 5, 5, 5, cv2.BORDER_CONSTANT, value=border_color)
                    dst = cv2.flip(dst, 1)

                # 이미지 위 글씨 설정
                dst_pill = Image.fromarray(dst)
                font = ImageFont.truetype('./font/NPSfont_bold.ttf',40)
                draw = ImageDraw.Draw(dst_pill)
                draw.text((460, 30),text,word_color,font=font)

                # np.ndarray형태로 확실히 변환하고 .jpg로 인코딩
                dst_final = np.array(dst_pill)
                ret, buffer = cv2.imencode('.jpg', dst_final)
                # 바이트로 변환
                frame = buffer.tobytes()
                
                val_dict_lst_str = json.dumps(val_dict_lst)

                # 여기서 시간별로 db에 넣는 로직
                # threading.Timer(1, dao.insert_live(id, val_dict_lst_str, class_pred)).start()
                if cnt_exist == 50: # 1분은 600
                    print(val_dict_lst_str)
                    print(class_pred)
                    # vo = dao.chuckchuDao()
                    # vo.insert_live(id, val_dict_lst_str, class_pred)
                    # cnt_exist = 0
                    # val_dict_lst = [{}]
                    # val_dict_lst_str = ''
                    # vo.close()

                yield (b'--frame\r\n'
                b'Content-Type: image/jpeg\r\n\r\n' + frame + b'\r\n')


            # 예외처리
            except:
                # Recolor image back to BGR for rendering
                image.flags.writeable = True   
                image = cv2.cvtColor(image, cv2.COLOR_RGB2BGR)
                dst = cv2.copyMakeBorder(image, 5, 5, 5, 5, cv2.BORDER_CONSTANT, value=(255,255,255))
                dst = cv2.blur(dst, (25,25))

                cnt_none += 1
                
                # Apply flip to the frame
                flipped_image = cv2.flip(dst, 1)

                ret, buffer = cv2.imencode('.jpg', flipped_image)
                frame = buffer.tobytes()

                if cnt_none == 1500:
                    print('객체 인식 X')
                    vo = dao.chuckchuDao()
                    vo.insert_live_none(id)
                    cnt_none = 0
                    vo.close()
                
                yield (b'--frame\r\n'
                b'Content-Type: image/jpeg\r\n\r\n' + frame + b'\r\n')
