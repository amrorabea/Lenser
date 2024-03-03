import cv2 as cv

# =====================Constants=====================
cap = cv.VideoCapture(0)
cap.set(3, 1280)
cap.set(4, 720)
cap.set(10, 70)

min_accuracy = 0.65  # Threshold to detect object
configPath = 'ssd_mobilenet_v3_large_coco_2020_01_14.pbtxt'
weightsPath = 'model.pb'
classFile = 'results.names'

with open(classFile, 'rt') as f:
    classNames = [line.rstrip() for line in f]
# ===================================================
net = cv.dnn_DetectionModel(weightsPath, configPath)
net.setInputSize(320, 320)
net.setInputScale(1.0 / 127.5)
net.setInputMean((127.5, 127.5, 127.5))
net.setInputSwapRB(True)

while True:
    _, img = cap.read()
    ResIds, confs, bbox = net.detect(img, confThreshold=min_accuracy)
    # print(classIds, bbox)

    if len(ResIds) != 0:
        for resId, accuracy, box in zip(ResIds.flatten(), confs.flatten(), bbox):
            cv.rectangle(img, box, color=(0, 0, 0), thickness=1)
            cv.putText(img, classNames[resId - 1].upper(), (box[0] + 10, box[1] + 30),
                       cv.FONT_HERSHEY_COMPLEX, 1, (0, 0, 255), 2)
            cv.putText(img, str(round(accuracy * 100, 2)), (box[0] + 200, box[1] + 30),
                       cv.FONT_HERSHEY_COMPLEX, 1, (0, 0, 255), 2)

    cv.imshow("Image", img)
    if cv.waitKey(1) & 0xFF == ord('q'):
        break

cap.release()
cv.destroyAllWindows()
