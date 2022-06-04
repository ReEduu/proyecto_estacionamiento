import mysql.connector

mydb = mysql.connector.connect(
host="localhost",
user="root",
password="",
database="estacionamiento"
)
    

def mysql_findCarId(placa):
    mycursor = mydb.cursor()
    sql = "SELECT car_id FROM registeredCars WHERE plate = %s"
    arg = (placa, )
    mycursor.execute(sql, arg)
    myresult = mycursor.fetchone()
    return myresult[0]

def mysql_getPlates():
    plates = []
    mycursor = mydb.cursor()
    sql = "SELECT plate FROM registeredCars"
    mycursor.execute(sql)
    myresult = mycursor.fetchall()
    for result in myresult:
        plates.append(result[0])
    return plates

def mysql_insertRegister(userId,carId):
    mycursor = mydb.cursor()
    sql = "INSERT INTO carLog (user_id,car_id,check_time,date) VALUES (%s, %s,CURTIME(),CURDATE())"
    val = (userId, carId)
    mycursor.execute(sql, val)
    mydb.commit()
    print(mycursor.rowcount, "record inserted.")

def mysql_checkCarsUsers(userId,carId):
    mycursor = mydb.cursor()
    sql = "SELECT carReg_id from carsusers WHERE user_id = %s and car_id = %s;"
    val = (userId, carId)
    mycursor.execute(sql, val)
    myresult = mycursor.fetchall()
    if len(myresult) > 0:
        return True
    else:
        return False





