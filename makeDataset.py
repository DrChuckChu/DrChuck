import cv2
import mediapipe as mp
import numpy as np
import math
import pandas as pd

mp_drawing = mp.solutions.drawing_utils
mp_pose = mp.solutions.pose
mp_holistic = mp.solutions.holistic
mp_drawing_styles = mp.solutions.drawing_styles

# 두 점 각도 구하기
def cal_angle(point1, point2):
    point1 = np.array(point1)
    point2 = np.array(point2)

    radians = np.arctan2(point2[1] - point1[1], point2[0] - point1[0])
    angle = np.abs(radians*180.0/np.pi)

    return angle

# 랜드마크별 좌표 구하는 함수
def get_coordinate(landmark, width, height):
    x = int(landmark.x * width)
    y = int(landmark.y * height)
    point = (x, y)
    return point

# 랜드마크를 잇는 기울기 구하는 함수
def get_slope(point1, point2):
    if point1[0] == point2[0]:
        return float('inf')
    else:
        return (point2[1] - point1[1]) / (point2[0] - point1[0])

# 점과 직선 사이의 거리
def get_dis(point, a, b, c):
    x = np.abs(a*point[0] + b*point[1] + c)
    y = math.sqrt(a**2 + b**2)
    return x/y

# 두 점 사이의 유클리디안 거리
def calculate_distance(point1, point2):
    return math.sqrt((point2[0] - point1[0])**2 + (point2[1] - point1[1])**2)


cap = cv2.VideoCapture(0)

w = cap.get(cv2.CAP_PROP_FRAME_WIDTH)
h = cap.get(cv2.CAP_PROP_FRAME_HEIGHT)

with mp_holistic.Holistic(min_detection_confidence=0.5, min_tracking_confidence=0.5) as holistic:
    
    time_num = 0 # 시간대신 쓸 시간변수

    shoulder_angle_lst = [] # 어깨 각도 리스트
    ear_angle_lst = [] # 귀 각도 리스트
    turtle_dis_lst = [] # 턱-어깨선 길이 리스트 -> 거북목 판별
    face_dis_lst = [] # 이마-턱 길이 리스트 -> 멀어지거나 지나치게 등받이 기대고 누운자세 판별

    while cap.isOpened():
        ret, frame = cap.read()
        time_num += 1

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

            if time_num == 10: # 숫자는 본인이 편한걸로 바꾸면 됨/어느정도 속도로 되는지 확인하려면 중간에 있는 print 하나 주석 풀면됨.
                # 어깨 좌표
                left_shoulder = get_coordinate(p_landmarks.landmark[11], w, h)
                right_shoulder = get_coordinate(p_landmarks.landmark[12], w, h)

                # 귀 좌표
                left_ear = get_coordinate(p_landmarks.landmark[7], w, h)
                right_ear = get_coordinate(p_landmarks.landmark[8], w, h)


                # 턱좌표 랜드마크 인덱스 152
                tuck = f_landmarks.landmark[152]
                tuck_point = get_coordinate(tuck, w, h)
                # print('(x, y) : ', tuck_point)

                # 이마 좌표 인덱스 10
                ima = f_landmarks.landmark[10]
                ima_point = get_coordinate(ima, w, h)

                # 어깨 사이 각
                shoulder_angle = cal_angle(right_shoulder, left_shoulder)
                # print('shoulder angle : ', shoulder_angle)
                shoulder_angle_lst.append(shoulder_angle)

                # 귀 사이 각
                ear_angle = cal_angle(right_ear, left_ear)
                # print('ear angle : ', ear_angle)
                ear_angle_lst.append(ear_angle)

                # 어깨 선 기울기 
                shoulder_slope = get_slope(left_shoulder, right_shoulder)
                # print(shoulder_slope)
                # 어깨 직선 절편
                b = left_shoulder[1] - shoulder_slope*left_shoulder[0]
                # print(b)

                # 턱-어깨선 사이의 거리
                turtle_dis = get_dis(tuck_point, -shoulder_slope, 1, -b)
                print(turtle_dis)
                turtle_dis_lst.append(turtle_dis)

                # 이마-턱 사이의 거리
                face_dis = calculate_distance(ima_point, tuck_point)
                # print(face_dis)
                face_dis_lst.append(face_dis)

                time_num = 0

            


            # Recolor image back to BGR for rendering
            image.flags.writeable = True   
            image = cv2.cvtColor(image, cv2.COLOR_RGB2BGR)
            
            
            # 1. Draw face landmarks
            mp_drawing.draw_landmarks(image, results.face_landmarks, mp_holistic.FACEMESH_CONTOURS, 
                                    mp_drawing.DrawingSpec(color=(80,110,10), thickness=1, circle_radius=1),
                                    mp_drawing.DrawingSpec(color=(80,256,121), thickness=1, circle_radius=1)
                                    )
            
            # 2. Right hand
            mp_drawing.draw_landmarks(image, results.right_hand_landmarks, mp_holistic.HAND_CONNECTIONS, 
                                    mp_drawing.DrawingSpec(color=(80,22,10), thickness=2, circle_radius=4),
                                    mp_drawing.DrawingSpec(color=(80,44,121), thickness=2, circle_radius=2)
                                    )

            # 3. Left Hand
            mp_drawing.draw_landmarks(image, results.left_hand_landmarks, mp_holistic.HAND_CONNECTIONS, 
                                    mp_drawing.DrawingSpec(color=(121,22,76), thickness=2, circle_radius=4),
                                    mp_drawing.DrawingSpec(color=(121,44,250), thickness=2, circle_radius=2)
                                    )

            # 4. Pose Detections
            mp_drawing.draw_landmarks(image, results.pose_landmarks, mp_holistic.POSE_CONNECTIONS, 
                                    mp_drawing.DrawingSpec(color=(245,117,66), thickness=2, circle_radius=4),
                                    mp_drawing.DrawingSpec(color=(245,66,230), thickness=2, circle_radius=2)
                                    )
            

            
            cv2.circle(image, tuck_point, 2, (0,0,255), -1)
            cv2.circle(image, ima_point, 2, (0,0,255), -1)

            cv2.imshow('Raw Webcap Feed', cv2.flip(image, 1))

            if cv2.waitKey(10) & 0xFF == ord('q'):

                data_df = pd.DataFrame({
                    'shoulder_angle_lst' : shoulder_angle_lst,
                    'ear_angle_lst' : ear_angle_lst,
                    'turtle_dis_lst' : turtle_dis_lst,
                    'face_dis_lst' : face_dis_lst,
                    'gender' : ['M']*len(face_dis_lst), # 성별 / 성별바꿔서 데이터 입력 시 바꿔주기
                    'class' : ['Turtle']*len(face_dis_lst) # class는 Bad, Good, Turtle로 나누고 한번찍을 때 한 class 정해서 여러번 찍기, 다른 class찍을 때는 df안에 class명 꼭 바꿔주기
                })

                data_df.to_csv('dataset_강진구.csv', header=False, index=False, mode='a') # mode='a' : 본인 csv파일에 이어서 쓸 수 있음

                break
        except:
            pass

cap.release()
cv2.destroyAllWindows()