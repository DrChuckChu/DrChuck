import numpy as np

def calculate_angle(point1, point2, point3):
    vector1 = np.array(point1) - np.array(point2)
    vector2 = np.array(point3) - np.array(point2)
    
    # `np.arctan2`를 사용하여 각도를 계산합니다.
    angle_rad = np.arctan2(vector2[1], vector2[0]) - np.arctan2(vector1[1], vector1[0])
    
    # 각도를 라디안에서 도(degree)로 변환
    angle_deg = np.degrees(angle_rad)
    
    return angle_rad, abs(angle_deg)

# 세 점(좌표)를 정의합니다.
point1 = (0, 0)
point2 = (1, 0)
point3 = (1, 1)

angle_rad, angle_deg = calculate_angle(point1, point2, point3)
print(f"세 점 간의 각도 (라디안): {angle_rad}")
print(f"세 점 간의 각도 (도): {angle_deg}")