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
    
    **Importante, cada vez que se quiera ejecutar el programa es necesario activar el ambiente de anaconda**
    
    Ejecutar el siguiente comando
    
    `conda create -n env_dlib python=3.6`
    
    Para verificar que el ambiente esta activado, el cmd se debe mostrar de la siguiente manera
    
    ![Ambiente conda!](/images/Conda_env.png)
    
 6. Instalar Dlib
    
    Ejecutar el siguiente comando
    
    `conda install -c conda-forge dlib`
    
7. Instalar face recognition

    Ejecutar el siguiente comando
    
    `pip install face_recognition`
    
#### Instalando easyocr

1. 
    
