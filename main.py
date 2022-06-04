from socket import timeout
import cv2
import numpy as np
import time
import serial


from cv2_acquire_visualize_module import *
from face_recognition_module import *
from easy_ocr_module import *
from mysql_module import *


#ser = serial.Serial('COM4',9600,timeout=1)
video_capture_1 = init_camera(2)
video_capture_2 = init_camera(0)
known_faces_encodings, known_faces_names = load_known_faces_and_encode(KNOWN_FACES_DIR)


while (True):
    flag3 = False
    rgb_frame, scaled_rgb_frame = acquire_image(video_capture_1)
    rgb_frame_2, scaled_rgb_frame_2 = acquire_image(video_capture_2)

    face_locations, face_encodings = extract_faces_and_encode(scaled_rgb_frame)
    flag1,placaN = reconocer_texto(rgb_frame_2)
    flag2, faces_id = find_face_matches(face_encodings, known_faces_encodings, known_faces_names)

    if flag2 == True and flag1 == True:
        carId = mysql_findCarId(placaN)
        for face_id in faces_id:
            if mysql_checkCarsUsers(face_id,carId):    
                flag3 = True
                userId = face_id
                break
    if flag3 == True: 
        #ser.write(b'P')
        mysql_insertRegister(userId,carId)
        print("PASA")
    else:
        print("NO PUEDE PASAR")

    time.sleep(10)

    

video_capture_1.release()
video_capture_2.release()
cv2.destroyAllWindows()
