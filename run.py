from app import app
import webbrowser
import threading
from flask import jsonify, request, render_template, Response
from werkzeug.utils import secure_filename
import cv2
import os
import mediapipe as mp
import numpy as np
import matplotlib.pyplot as plt

from app import dao, live, views

# app = init()

camera = None  # use 0 for web camera


@app.route('/upload', methods=['POST'])
def upload_file():
    if 'image' not in request.files:
        return 'No image part'
    
    file = request.files['image']
    # file = request.get_json()

    if file.filename == '':
        return 'No selected image'
    if file:
        filename = secure_filename(file.filename)
        file.save(os.path.join('upload_img/', filename))
        f_name_lst = filename.split('_')
        img = f'./upload_img/{filename}'
        return Response(views.gen_frames(img, f_name_lst, filename))


# 웹캠 열기 - 세션에서 받을 내용 : 아이디, 성별
# DB에 넣을 내용 - 아이디, 좌표값(values), 측정결과
get_session = {}

@app.route('/openWebcam', methods=['POST'])
def open_webcam():
    global camera
    if request.method == 'POST':
        # POST 요청을 처리하는 코드
        #     JSON 형식의 요청 데이터 파싱
        print(request.is_json)
        data = request.get_json()
        member_id = data['회원아이디']
        member_gender = data['성별']

        if member_id and member_gender:
            print(member_id, member_gender)
            get_session['id'] = member_id
            get_session['gender'] = member_gender
        else:
            return '회원아이디와 성별을 제대로 전달받지 못했습니다.', 400

    if camera is None:
        camera=cv2.VideoCapture(0)

    return '웹캠을 열었습니다.', 200

# mediapipe 프레임단위로 처리를 웹 화면에 넣어줌
@app.route('/live_chu')
def live_chu():
    return Response(live.gen_frames(camera, get_session), mimetype='multipart/x-mixed-replace; boundary=frame')


# 웹캠 닫기
@app.route('/stopWebcam', methods=['POST'])
def close_webcam():
    global camera

    camera.release()
    camera = None  # Ensure the reference to the webcam is cleared
    cv2.destroyAllWindows()

    return '웹캠이 닫혔습니다.', 200


if __name__ == '__main__': # 만약 파일이 실행된다면, __main__으로 값이 변경
    # 이 파일을 실행한다면~~~
    app.run(host="192.168.56.1", # Flask 코드를 실행하는 컴퓨터의 ip주소
           port=5000)