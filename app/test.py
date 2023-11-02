from flask import render_template, Response, jsonify
import cv2
import mediapipe as mp
import time
from .modules.landmarks import draw_labels
from .modules.vit_pose import AppPoseModel, AppDetModel
from . import app
import base64
import os
from PIL import Image
import io
import numpy as np


# mediapipe 초기 설정
mp_face_mesh = mp.solutions.face_mesh
mp_drawing = mp.solutions.drawing_utils
face_mesh = mp_face_mesh.FaceMesh()

webcam_state = False

img1 = './img_test/F_123_231027165752.png'
img2 = './img_test/S_123_231027165752.png'
img = [img1, img2]


det_model = AppDetModel()
pose_model = AppPoseModel()

for idx, imgs in enumerate(img):
    image = cv2.imread(imgs)
    if image is None:
        print('이미지 없음')

        
    det_results, vis_det = det_model.run("YOLOX-l", image, 0.3) # detection 결과 이미지가 List[np.ndarray], np.ndarray로 반환됨
    pose_results, vis_pose = pose_model.run("ViTPose-B (multi-task train, COCO)",
                                            image, det_results, 0.5, 0.3, 4,
                                            1) # pose_result: List[Dict[str, np.ndarray]] 형태, vis_pose: np.ndarray형태->결과 이미지에 선,점 표현한 이미지

    print(pose_results) # bbox랑 keypoints볼 수 있음

    # 이미지 인코딩
    # ret, jpeg = cv2.imencode('.jpg', vis_pose)
    # frame = jpeg.tobytes()
    # base_str = base64.b64encode(frame).decode('utf-8')

    # base64 디코딩
    # img_out = base64.b64decode(base_str)
    # nparr = np.frombuffer(img_out, np.uint8)
    # img_np = cv2.imdecode(nparr, cv2.IMREAD_COLOR)
    # cv2.imwrite('./img/test123.jpg', img_np)

