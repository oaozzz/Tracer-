#-*- coding:utf-8 -*-

import os
import cv2
import numpy as np
import pyautogui as pag
import urllib.request
import asyncio
import sys, os
import shutil
from PIL import ImageFont, ImageDraw, Image
# from ..OCR import plate_main

# from plate_main import result_chars

CONFIDENCE = 0.9 # 참,거짓
THRESHOLD = 0.3 #
LABELS = ['car','plate']
CAR_WIDTH_TRESHOLD = 500
PlATE_WIDTH_TRESHOLD = 1
net = cv2.dnn.readNetFromDarknet('cfg/yolov4-ANPR.cfg', 'yolov4-ANPR.weights')

protocol = 'http'
base_name = '172.30.1.36'
path = '/snapshot.jpg'
port = 8000
url = f'{protocol}://{base_name}:{port}{path}'
print(url)

async def update_img():
    req = urllib.request.urlopen(url)
    arr = np.asarray(bytearray(req.read()), dtype=np.uint8)
    img = cv2.imdecode(arr, -1)  # 'Load it as it is'

# =============================================================================
    H, W, _ = img.shape  # img의 가로 세로 사이즈

    # opencv는 BGR순서로 사용 , Darknet은 RGB이므로 R과 B를 swap해준다.
    blob = cv2.dnn.blobFromImage(img, scalefactor=1 / 255., size=(416, 416), swapRB=True)

    net.setInput(blob)
    output = net.forward()

    boxes, confidences, class_ids = [], [], []

    for det in output:
        # 다크넷에서 앞 4자리까지는 box변수 x,y,w,h, 5번째 자리부터는 label의 score
        # x,y 는 중심 좌표 w,h는 너비와 높이
        box = det[:4]
        scores = det[5:]
        class_id = np.argmax(scores)
        confidence = scores[class_id]

        if confidence > CONFIDENCE:  # 인식 결과 참일 확률이 0.9 이상이라면 실행
            # cx: center x좌표, cy: center y좌표 w: 너비 h:높이
            cx, cy, w, h = box * np.array([W, H, W, H])  # 곱하기를 통해 픽셀값으로 변환
            x = cx - (w / 2)
            y = cy - (h / 2)

            boxes.append([int(x), int(y), int(w), int(h)])
            confidences.append(float(confidence))
            class_ids.append(class_id)

    # Non Max Suppression Boxes 이용하여 index로 압축
    idxs = cv2.dnn.NMSBoxes(boxes, confidences, CONFIDENCE, THRESHOLD)

    if len(idxs) > 0:
        for i in idxs.flatten():
            x, y, w, h = boxes[i]

            # 박스
            cv2.rectangle(img, pt1=(x, y), pt2=(x + w, y + h), color=(255, 0, 0), thickness=2)

            #텍스트
            #cv2.putText(img, text='%s %.2f %d' % (LABELS[class_ids[1]], confidences[1], w), org=(x, y - 10), fontFace=cv2.FONT_HERSHEY_SIMPLEX, fontScale=1, color=(0, 255, 0), thickness=2)

            cv2.rectangle(img, pt1=(x, y), pt2=(x + w, y + h), color=(0, 0, 255), thickness=2)
            cv2.putText(img, text = '%s %.2f %d' % (LABELS[class_ids[i]], confidences[i], w), org=(x, y - 10),
                        fontFace=cv2.FONT_HERSHEY_SIMPLEX, fontScale=1, color=(0, 0, 255), thickness=2)
            #text = '%s %.2f %d' % (LABELS[class_ids[i]], confidences[i], w)
            #path = "C:/Users/SMHRD/PycharmProjects/Tracer-/pycharmGit/OCR/capture001.jpg"
            #pag.screenshot(path,(10,32,646,508))

            # # 박스 캡처를 위한 코드 (보류)
            # left_bottom = (x, y)
            # right_top = (x + w, y + h)
            # left_top = (x,y+h)
            #
            #
            # left_bottom_x = left_bottom[0]
            # right_top_y = right_top[1]
            #
            # capture_width = right_top[0] - left_bottom_x
            # capture_height = right_top[1] - left_bottom[1]

    return img
# ==================================================
#workingDir = ('C:/Users/SMHRD/PycharmProjects/Tracer-/pycharmGit/plateLabeling')
#
#executeFile = ('plate_main.py')
#
#def run(path):
#
     #Working Directory
#
     #os.chdir(workingDir)
#
#     # File Run
#
     #os.system(path)

async def main():
    prev_task = None
    while True:
        if prev_task is not None:
            img = await prev_task
            cv2.imshow('result', img)
            cv2.waitKey(1)
        prev_task = asyncio.create_task(update_img())
    cv2.destroyAllWindows()


asyncio.run(main())

#
