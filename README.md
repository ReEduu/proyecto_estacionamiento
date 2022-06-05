# Proyecto vision para robots
Proyecto de un estacionamiento manejado por visión por computadora

### Instalación y ejecución del programa

La siguiente guia se enfoca en el sistema operativo windows

#### Instalando face_recognition
1. Instalar Cmake

    En la siguiente página se encuentran los archios para instalar Cmake https://cmake.org/download/
  
    En el caso de Windows, se puede elegir directamente el instalador
  
    Importante durante la instalación, elegir la opción de añadir al Path, en cualquiera de las dos opciones
  
    ![Opcion a elegir Cmake!](/images/Cmake_ins.png)
    
    Una vez instalado será necesario verificar que se encuentre en el PATH desde las variables de entorno del sistema
    
    ![Comprobar Cmake!](/images/Cmake_path.png)
2. Instalar Anaconda

    Desde la siguiente página https://www.anaconda.com/products/distribution se puede descargar el instalador, posteriormente se ejecuta
3. Actualizar anaconda

    Ya sea en cmd o en el anaconda prompt, ejecutar los siguientes comandos
    
    `conda update conda`
    
    `conda update anaconda`
4. Crear un nuevo ambiente de anaconda

    Ejecutar el siguiente comando
    
    `conda create -n env_dlib python=3.6`
5. Activar el ambiente
    
    **Importante, a partir de ahora y cada vez que se quiera ejecutar el programa, es necesario activar el ambiente de anaconda**
    
    Ejecutar el siguiente comando
    
    `conda activate env_dlib`
    
    Para verificar que el ambiente esta activado, el cmd se debe mostrar de la siguiente manera
    
    ![Ambiente conda!](/images/Conda_env.png)
    
 6. Instalar Dlib
    
    Ejecutar el siguiente comando
    
    `conda install -c conda-forge dlib`
    
7. Instalar face recognition

    Ejecutar el siguiente comando
    
    `pip install face_recognition`
    
#### Instalando easyocr

1. Instalar easy_ocr

    Ejecutar el siguiente comando
    
    `pip install easyocr`
 
2. Solucionar error con numpy

    Al instalar easyocr se genera un error, para solucionarlo, simplemente se ejcuta lo siguiente
    
    `pip uninstall numpy`
    
    `pip install numpy`
    
#### Instalando pyserial

1. Instalar pyserial

    Para la comunicancion de python con el arduino, se usa pyserial, se instala se la siguiente forma
    
    `pip install pyserial`
    
#### Instalando mysql connector

1. Instalar mysql connector

    Para comunicarse con la base de datos desde python, se usa esta libreria que se instala de la siguiente manera
    
    `pip install mysql-connector-python`
    
#### Crear base de datos mysql 

1. Instalar mysql

    Dirigirse a la siguiente página, descargar el instalador y ejecutarlo https://dev.mysql.com/downloads/installer/
    
    Con la instalación default es suficiente, para dudas consultar la documentación: https://dev.mysql.com/doc/refman/8.0/en/windows-installation.html
    
    **Importante recordar la contraseña elegida, ya que se usa para entrar a mysql**
    
2. Crear base de datos
    
    Existen dos opciones para crear la base
    
    1. Si no conoce de mysql, lea completamente el archivo txt "base de datos sql" que se encuentra en el repositorio
    
    2. Si conoces mysql, en el repositorio hay un archivo "estacionamiento.sql" con el que se puede restaurar la base

3. Para alguna duda con la estructura de la base de datos, se puede consultar el siguiente diagrama
    
    ![Base mysql!](/images/BaseSQL_estacionamiento.png)

4. Modificar código mysql_module.py . 
    
    En la linea 6 introducir el password usado durante la instalación de mysql

#### Conexión con Arduino

El circuito propuesto es el siguiente

![Arduino!](/images/arduino_conex.png)

1. Suba el código al Arduino que se encuentra en la carpeta de arduino, desde el IDE de arduino
2. Para que funcione en conjunto con el programa se debe mantener conectado el Arduino a la PC
3. En el código main.py quitar el comentario (#) de las lineas 14 y 37. En la linea 14, cambiar el puerto COM al que está conectado el arduino
    
#### Ejecutar el programa

**Comprobar tener fotos en las carpetas 1 y 2 de known faces, no cambiarles el nombre a las carpetas**

1. Asegurarse de tener por lo menos dos camaras conectadas, en las lineas 15 y 16 del main.py, se seleccionan las camaras a usar, siendo video_capture_1 la del rostro y video_capture_2 la de las placas 
2. Desde el cmd dirigirse a la ubicacion del archivo principal, **asegurarse de tener activado el entorno de anaconda**
3. Ejecutar el programa con 
    
    `python main.py`

