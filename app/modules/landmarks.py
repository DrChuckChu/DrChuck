import cv2

# 코, 눈, 입의 랜드마크 인덱스
NOSE_TIP = 4
LEFT_EYE_INNER = 159
LEFT_EYE_OUTER = 33
RIGHT_EYE_INNER = 386
RIGHT_EYE_OUTER = 263
MOUTH_LEFT = 291
MOUTH_RIGHT = 61


def draw_labels(image, landmarks):
    # 코
    cv2.putText(image, 'Nose', (int(landmarks.landmark[NOSE_TIP].x * image.shape[1]),
                                int(landmarks.landmark[NOSE_TIP].y * image.shape[0])),
                cv2.FONT_HERSHEY_SIMPLEX, 0.5, (255, 255, 255), 2)

    # 눈
    cv2.putText(image, 'Left Eye', (int(landmarks.landmark[LEFT_EYE_OUTER].x * image.shape[1]),
                                   int(landmarks.landmark[LEFT_EYE_OUTER].y * image.shape[0])),
                cv2.FONT_HERSHEY_SIMPLEX, 0.5, (255, 255, 255), 2)
    cv2.putText(image, 'Right Eye', (int(landmarks.landmark[RIGHT_EYE_OUTER].x * image.shape[1]),
                                    int(landmarks.landmark[RIGHT_EYE_OUTER].y * image.shape[0])),
                cv2.FONT_HERSHEY_SIMPLEX, 0.5, (255, 255, 255), 2)

    # 입
    cv2.putText(image, 'Mouth', (int(landmarks.landmark[MOUTH_LEFT].x * image.shape[1]),
                                 int(landmarks.landmark[MOUTH_LEFT].y * image.shape[0])),
                cv2.FONT_HERSHEY_SIMPLEX, 0.5, (255, 255, 255), 2)
