from easyocr import Reader
import argparse
import cv2
from mysql_module import *

def cleanup_text(text):
	return "".join([c if ord(c) < 128 else "" for c in text]).strip()
ap = argparse.ArgumentParser()

palabrasDetectadas = []
placas = mysql_getPlates()


ap.add_argument("-l", "--langs", type=str, default="en",
	help="comma separated list of languages to OCR")
ap.add_argument("-g", "--gpu", type=int, default=-1,
	help="whether or not GPU should be used")
args = vars(ap.parse_args())

langs = args["langs"].split(",")
# load the input image from disk
def reconocer_texto(image):
	paso = False
	palabrasDetectadas = []
	placaNum = ""
	reader = Reader(langs, gpu=args["gpu"] > 0)
	results = reader.readtext(image)

	for (bbox, text, prob) in results:
		(tl, tr, br, bl) = bbox
		tl = (int(tl[0]), int(tl[1]))
		tr = (int(tr[0]), int(tr[1]))
		br = (int(br[0]), int(br[1]))
		bl = (int(bl[0]), int(bl[1]))
		text = cleanup_text(text)
		if "-" in text:
			palabrasDetectadas.append(text)

	print(palabrasDetectadas)
	for placa in placas:
		for palabra in palabrasDetectadas:
			if palabra == placa:
				paso = True
				placaNum = placa
	return paso, placaNum
#cv2.imshow("Result", image)
#cv2.waitKey(0)