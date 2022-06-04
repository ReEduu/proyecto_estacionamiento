from mysql_module import *

faces = [1,"Unknown",2]
carId = 1
flag3 = False

for face in faces:
    if mysql_checkCarsUsers(face,carId):    
        flag3 = True
        userId = face
        break

if flag3:
    print(face)
else:
    print("nel")
