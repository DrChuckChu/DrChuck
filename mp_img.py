import cv2
import mediapipe as mp
import numpy as np
import matplotlib.pyplot as plt

# 점으로 포즈랜드마크 표시 변수 그림 초기화
mp_drawing = mp.solutions.drawing_utils
# 스타일지정 변수
mp_drawing_style = mp.solutions.drawing_styles
# meidapipe pose 모델 / hand, face 있음
# 포즈클래스를 초기화
mp_pose = mp.solutions.pose
# face 모듈
mp_face = mp.solutions.face_detection
# face mesh
mp_face_mesh = mp.solutions.face_mesh

img1 = './img/myimg.jpg'
img2 = './img/myimg2.jpg'
img3 = './img/myimg3.jpg'
img4 = './img/red_gril.jpg'
img_files = [img3] # 이미지 리스트
bg_color = (192, 192, 192) # 회색

# 랜드마크를 잇는 기울기 구하는 함수
def get_slope(point1, point2):
    if point1[0] == point2[0]:
        return float('inf')
    else:
        return (point2[1] - point1[1]) / (point2[0] - point1[0])
    
# 랜드마크별 좌표 구하는 함수
def get_coordinate(landmark, width, height):
    x = int(landmark.x * width)
    y = int(landmark.y * height)
    point = (x, y)
    return point

# 세 좌표로 사이 각도 구하는 함수
def cal_angle(point1, point2, point3) :
    vec1 = np.array(point1) - np.array(point2)
    vec2 = np.array(point3) - np.array(point2)

    radian = np.arctan2(vec2[1], vec2[0]) - np.arctan2(vec1[1], vec1[0])
    degree = np.degrees(radian)

    return abs(degree)


# Pose()함수 호출
with mp_pose.Pose(
        static_image_mode = True, # 여러 이미지로 작업할 때 True, 비디오는 False
        model_complexity = 2, # pose landmark model의 복잡도 0, 1, 2
        enable_segmentation = True, # pose landmark 외에도 solution에서 분할 마스크를 적용한다
        min_detection_confidence = 0.5 # 탐지 성공으로 간주하는 사람 탐지 모델의 최소 신뢰값은([0.0, 0.1]) 기본값은 0.5
        ) as pose, \
    mp_face.FaceDetection(
        model_selection=1, # 0 or 1 : 2미터 이내에서 촬영한 얼굴이냐 아니냐에 따라 부여
        min_detection_confidence=0.5 # 얼굴로 인식하기 위한 확률 값으로 1에 가까울 수록 좀 더 확실한 얼굴만 인식
         ) as face, \
    mp_face_mesh.FaceMesh(
        static_image_mode=True,  # 이미지 모드 사용
        max_num_faces=1,  # 감지할 얼굴 수 (1개로 설정)
        min_detection_confidence=0.5,
        min_tracking_confidence=0.5
    ) as face_mesh:
    
    for idx, file in enumerate(img_files):
        image = cv2.imread(file)
        image_height, image_width, _ = image.shape
        # 처리 전 BGR 이미지를 RGB로 변환
        # RGB이미지에 대한 포즈 추정 수행
        result_p = pose.process(cv2.cvtColor(image, cv2.COLOR_BGR2RGB))
        result_f = face.process(cv2.cvtColor(image, cv2.COLOR_BGR2RGB))

        annotated_image = image.copy()

        # pose----------------------------------------------------------------------------
        if result_p.pose_landmarks :
            # 원본이미지에 랜드마크 그리기 - pose
            mp_drawing.draw_landmarks(
                annotated_image,
                result_p.pose_landmarks,
                mp_pose.POSE_CONNECTIONS
                # landmark_drawing_spec = mp_drawing_style.get_default_pose_landmarks_style()
            )

        # face ------------------------------------------------------------------------
        # if result_f.detections:
        #     for detection in result_f.detections:
        #         bboxC = detection.location_data.relative_bounding_box
        #         x, y, w, h = int(bboxC.xmin * image_width), int(bboxC.ymin * image_height), int(bboxC.width * image_width), int(bboxC.height * image_height)

        #         result_mesh = face_mesh.process(cv2.cvtColor(annotated_image, cv2.COLOR_BGR2RGB))

                

        #         # if result_mesh.multi_face_landmarks:
        #         #     for face_landmarks in result_mesh.multi_face_landmarks:
        #         #         left_ear = face_landmarks.landmark[454]
        #         #         right_ear = face_landmarks.landmark[234]
        #         #         print('Left Ear : ', left_ear)
        #         #         print('Right Ear : ', right_ear)

        #         mp_drawing.draw_detection(annotated_image, detection)


        # 좌표, 각도, 기울기 로직--------------------------------------------------------
        # print(type(annotated_image)) # annotated_image는 배열 형태임

        hip = result_p.pose_landmarks.landmark[24]
        hip_point = get_coordinate(hip, image_width, image_height)

        shoulder = result_p.pose_landmarks.landmark[12]
        shoulder_point = get_coordinate(shoulder, image_width, image_height)

        # 기울기
        slope = get_slope(shoulder_point, hip_point)
        # y절편
        b = shoulder_point[1] - slope*shoulder_point[0]

        # 직선그리기
        # if slope < 0:
        #     for x in range(ugga_point[0], image_width):
        #         y = int(slope*x + b)
        #         if 0 <= y < image_height:
        #             annotated_image[y, x] = (0, 0, 255) # 빨간색선
        # else :
        #     for x in range(0, ugga_point[0]):
        #         y = int(slope*x + b)
        #         if 0 <= y < image_height:
        #             annotated_image[y, x] = (0, 0, 255) # 빨간색선


        # 무릎각도 구하기 - 엉덩이, 무릎, 발목
        knee = result_p.pose_landmarks.landmark[26]
        knee_point = get_coordinate(knee, image_width, image_height)

        ankle = result_p.pose_landmarks.landmark[28]
        ankle_point = get_coordinate(ankle, image_width, image_height)
        # 하체 각도는 360에서 빼야함
        angle_knee = cal_angle(hip_point, knee_point, ankle_point)
        print(f'다리 각도는 {round(360 - angle_knee)}도 입니다.')

        # 팔 각도 구하기 - 어깨, 팔꿈치, 손목
        elbow = result_p.pose_landmarks.landmark[14]
        elbow_point = get_coordinate(elbow, image_width, image_height)

        wrist = result_p.pose_landmarks.landmark[14]
        wrist_point = get_coordinate(wrist, image_width, image_height)
        # 상체 각도는 그대로 출력
        angle_arm = cal_angle(shoulder_point, elbow_point, wrist_point)
        print(f'팔 각도는 {round(angle_arm)}도 입니다.')

        # 실선 긋는 로직 - 기울기 음수일 때랑 아닐 때랑 나눠서 함수로 만드는게 편할듯
        # cv2.line(annotated_image, hip_point, (int(-b/slope), 0), (0,0,255), thickness=2)

        plt.figure(figsize=(15,15))
        plt.title('img');plt.axis('off');plt.imshow(annotated_image[:,:,::-1]);plt.show()

        # cv2.imshow('line', annotated_image)
        # cv2.resizeWindow(winname='line', width=2000, height=2000)
        # # 아무 키나 누르면 창을 닫습니다.
        # cv2.waitKey(0)
        # cv2.destroyAllWindows()
           
        