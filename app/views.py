from flask import render_template, Response, jsonify
import cv2
import mediapipe as mp
import time
from .modules.landmarks import draw_labels
from .modules.vit_pose import AppPoseModel, AppDetModel
from . import app
import base64
import os
import io
import numpy as np
import matplotlib
import json

from calculation import cal
from app import dao

matplotlib.use('Agg')


# mediapipe 초기 설정
mp_face_mesh = mp.solutions.face_mesh
mp_drawing = mp.solutions.drawing_utils
face_mesh = mp_face_mesh.FaceMesh()

webcam_state = False

# 이미지 파일의 경우
def gen_frames(img, f_name_lst, filename):

    img_file = [img]
    state = f_name_lst[0] # 사진 구분
    id = f_name_lst[1] # 사용자 아이디

    f_name = filename # 파일 이름
    print(state, id, f_name) # 잘 들어왔나 확인
    print(img_file)

    det_model = AppDetModel()
    pose_model = AppPoseModel()

    for idx, imgs in enumerate(img_file):
        result_str = ''
        values_lst = []
        image = cv2.imread(imgs)
        if image is None:
            print('이미지 없음')

        
        det_results, vis_det = det_model.run("YOLOX-l", image, 0.3) # detection 결과 이미지가 List[np.ndarray], np.ndarray로 반환됨
        pose_results, vis_pose = pose_model.run("ViTPose-B (multi-task train, COCO)",
                                                image, det_results, 0.5, 0.3, 5,
                                                3) # pose_result: List[Dict[str, np.ndarray]] 형태, vis_pose: np.ndarray형태->결과 이미지에 선,점 표현한 이미지
        # print(pose_results)
        h, w, _ = vis_pose.shape # vis_pose 높이, 너비

        points = pose_results[0]['keypoints'] # keypoint 리스트
        x_le = int(points[3][0]) # 왼쪽귀
        y_le = int(points[3][1])

        x_re = int(points[4][0]) # 오른쪽 귀
        y_re = int(points[4][1])

        x_ls = int(points[5][0]) # 왼쪽 어깨
        y_ls = int(points[5][1])

        x_rs = int(points[6][0]) # 오른쪽 어깨
        y_rs = int(points[6][1])

        x_lh = int(points[11][0]) # 왼 엉덩이
        x_lkn = int(points[13][0]) # 왼 무릎

        # np.ndarray를 이미지로 인식하지 못하는 경우가 있기 때문에 강제로 변환해주는 작업
        vis_pose = cv2.cvtColor(vis_pose, cv2.COLOR_BGR2RGB)
        vis_pose = np.array(vis_pose, dtype=np.uint8)
        vis_pose = cv2.cvtColor(vis_pose, cv2.COLOR_RGB2BGR)

        if state == 'F':
            ear_feedback, ear_angle = cal.f_feedback((x_re, y_re), (x_le, y_le))
            values_lst.append(ear_angle)

            shoulder_feedback, shoulder_angle = cal.f_feedback((x_rs, y_rs), (x_ls, y_ls))
            values_lst.append(shoulder_angle)

            val_dict_lst = [{
                'shoulder_angle' : values_lst[0],
                'ear_angle' : values_lst[1]
            }]
            # print(val_dict_lst)
            val_dict_lst_str = json.dumps(val_dict_lst)
            print(val_dict_lst_str)

            result_str = f"""
            현재, {id},님의, 정면 결과입니다.,
            고개 기울임 각도는, {ear_feedback}
            어깨 기울임 각도는, {shoulder_feedback}
            정면에서 봤을 때 고개와 어깨는 기울어짐이 없이 균형적인 모습이어야 좋은 자세라고 할 수 있습니다.,
            PC작업을 할 때 책상의 끝에 손이 위치할 수 있도록 키보드를 위치해 보세요!,
            """
            print(result_str)
            # db update
            vo = dao.chuckchuDao()
            vo.update_upload(id, state, f_name, val_dict_lst_str, result_str)
            val_dict_lst = [{}]
            val_dict_lst_str = ''
            vo.close()
        
        elif state == 'S':
            # cv2.line(vis_pose, (x_le, 0), (x_le, h), (0,0,255), 3)
            # cv2.line(vis_pose, (x_ls, 0), (x_ls, h), (0,255,0), 3)

            if x_lh > x_lkn: # 왼쪽 방향일 때
                turtle_angle = int(cal.cal_angle((x_le, y_le), (x_ls, y_ls)))
                values_lst.append(turtle_angle)
                # print(turtle_angle)
            else: # 오른쪽 방향일 때
                turtle_angle = int(180 - cal.cal_angle((x_re, y_re), (x_rs, y_rs)))
                values_lst.append(turtle_angle)
                # print(turtle_angle)
            
            
            if turtle_angle >= 50:
                result_str = f"""
                현재, {id},님의, 측면 결과입니다.,
                전방머리자세각도(CVA), 추정값은 {turtle_angle},도 입니다.,
                거북목이 아닌 자세를 유지하고 계시군요!,
                일반적으로 CVA각도가, 50도 미만,일 때, 거북목이라고 판단합니다.,
                또한, 사진에 그려진 귀 선과 어깨 선이 일치할 수록 거북목이 아닌 좋은 자세입니다.,
                좋은 자세를 유지할 수 있도록 노력해봐요!,
                장시간 앉아 있는 경우 자세가 흐트러질 수 있습니다., 틈틈히 자리에서 일어나 스트레칭도 해봐요!,
                """
            else:
                result_str = f"""
                현재, {id},님의, 전방머리자세각도(CVA), 추정값은 {turtle_angle},도 입니다.,
                거북목이 의심됩니다.,
                일반적으로 CVA각도가, 50도 미만,일 때, 거북목이라고 판단합니다.,
                또한, 사진에 그려진 귀 선과 어깨 선이 일치할 수록 거북목이 아닌 좋은 자세입니다.,
                PC작업을 하실 때 자세에 조금 더 신경써봐요!,
                장시간 앉아 있는 경우 자세가 흐트러질 수 있습니다., 틈틈히 자리에서 일어나 스트레칭도 해봐요!,
                """
            print(result_str)            
            val_dict_lst = [{
                'turtle_angle': values_lst[0]
            }]
            val_dict_lst_str = json.dumps(val_dict_lst)
            # db update
            vo = dao.chuckchuDao()
            vo.update_upload(id, state, f_name, val_dict_lst_str, result_str)
            val_dict_lst = [{}]
            val_dict_lst_str = ''
            vo.close()



        # 이미지 인코딩
        ret, jpeg = cv2.imencode('.jpg', vis_pose)
        frame = jpeg.tobytes()
        base_str = base64.b64encode(frame).decode('utf-8')

        # base64 디코딩
        # img_out = base64.b64decode(base_str)
        # nparr = np.frombuffer(img_out, np.uint8)
        # img_np = cv2.imdecode(nparr, cv2.IMREAD_COLOR)
        # cv2.imwrite('./img/test123.jpg', img_np)

        return base_str