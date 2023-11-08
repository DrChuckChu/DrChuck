import cv2
import mediapipe as mp
import numpy as np
import matplotlib.pyplot as plt

mp_drawing = mp.solutions.drawing_utils
# 스타일지정 변수
mp_drawing_style = mp.solutions.drawing_styles
# meidapipe pose 모델 / hand, face 있음
# 포즈클래스를 초기화
mp_pose = mp.solutions.pose

img3 = './img/myimg3.jpg'
img_files = [img3] # 이미지 리스트

with mp_pose.Pose(
        static_image_mode = True, # 여러 이미지로 작업할 때 True, 비디오는 False
        model_complexity = 2, # pose landmark model의 복잡도 0, 1, 2
        enable_segmentation = True, # pose landmark 외에도 solution에서 분할 마스크를 적용한다
        min_detection_confidence = 0.5 # 탐지 성공으로 간주하는 사람 탐지 모델의 최소 신뢰값은([0.0, 0.1]) 기본값은 0.5
        ) as pose:
    
    for idx, file in enumerate(img_files):
        image = cv2.imread(file)
        image_height, image_width, _ = image.shape
        # 처리 전 BGR 이미지를 RGB로 변환
        # RGB이미지에 대한 포즈 추정 수행
        result_p = pose.process(cv2.cvtColor(image, cv2.COLOR_BGR2RGB))

        annotated_image = image.copy()

        # pose----------------------------------------------------------------------------
        if result_p.pose_landmarks :
            # 원본이미지에 랜드마크 그리기 - pose
            mp_drawing.draw_landmarks(
                annotated_image,
                result_p.pose_landmarks,
                mp_pose.POSE_CONNECTIONS,
                landmark_drawing_spec = mp_drawing.DrawingSpec(thickness=3, circle_radius=7),
                connection_drawing_spec = mp_drawing.DrawingSpec(thickness=3, circle_radius=7)
            )
        plt.figure(figsize=(15,15))
        plt.title('img');plt.axis('off');plt.imshow(annotated_image[:,:,::-1]);plt.show()
        # cv2.imshow('MediaPipe FaceMesh', annotated_image)
        # cv2.waitKey(0)
        # cv2.destroyAllWindows()