import numpy as np
import math

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


# 정면 이미지용 멘트 생성
def f_feedback(point1, point2):
    angle = cal_angle(point1, point2)
    angle = int(angle)

    if angle <= 5:
        return f'{angle}도로 아주 좋습니다!,', angle
    else:
        return f'{angle}도 입니다., 기울임에 더 신경써보세요!,', angle
