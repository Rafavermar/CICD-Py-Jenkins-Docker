# Simulador de Lanzamiento de Dados

## Descripción
Esta aplicación simula el lanzamiento de dados con diferentes configuraciones de cantidad de dados y caras por dado. Usaremos la biblioteca `dice` para manejar la lógica de los lanzamientos de dados. La aplicación permite definir el número de lanzamientos y las caras de cada dado, mostrando el resultado de cada lanzamiento con un intervalo de espera entre cada uno.

## Requisitos
1. **Python 3.9**: La aplicación está diseñada para correr en un entorno con Python 3.9.
2. **Biblioteca `dice`**: Utilizada para simular el lanzamiento de dados.
3. **GitHub**: El repositorio está alojado en GitHub para facilitar la colaboración y el control de versiones.
4. **Docker**: Utilizaremos Docker para contenerizar la aplicación y asegurar la replicabilidad del entorno.

## Instalación
1. Clona el repositorio en tu máquina local:
   ```bash
   git clone https://github.com/Rafavermar/CICD-Py-Docker-Jenkins.git
   cd CICD-Py-Docker-Jenkins
   ```

2. Crea un entorno virtual (opcional pero recomendado) y activa el entorno:
    ```
      python -m venv venv
      source venv/bin/activate  # En Windows: venv\Scripts\activate
   ```
3. Instala las dependencias:
    ```
   pip install -r requirements.txt
    ```
   
## Ejecución
Para ejecutar la aplicación, ejecuta el archivo principal:
    ```
    python main.py
    ```

## Estructura del Proyecto

- __main.py__: Contiene el código de la aplicación que simula el lanzamiento de dados.
- __requirements.txt__: Lista de dependencias, incluyendo dice.
- __Dockerfile__: Define la imagen de Docker para contenerizar la aplicación.

## Funcionalidad Principal
La aplicación utiliza una función __roll(amount, sides)__ que recibe dos argumentos:
- __amount__: Número de dados a lanzar.
- __sides__: Número de caras en cada dado.

### Ejemplo de Uso
La función será ejecutada con los parámetros __amount=5__ y __sides=6__, y el resultado se mostrará en el siguiente formato, con una pausa de 5 segundos entre lanzamientos:
    ```
    Lanzamiento {número de lanzamiento} número obtenido {resultado lanzamiento}
    ```

## Flujo de Trabajo en Git
El desarrollo y control de versiones de este proyecto se realiza a través de Git y GitHub. Los pasos del flujo de trabajo son los siguientes:

### Rama main
1. Commit inicial: Crear el archivo README.md con la descripción del proyecto.
2. Segundo commit: Añadir el código base al archivo main.py.
3. Tercer commit: Realizar una modificación en el mensaje de salida en main.py.
4. Revert: Hacer un revert del último commit para volver al mensaje de salida anterior.

### Rama feature/rol
1. Crear la rama feature/rol a partir de main.
2. Modificar el dado para que tenga 20 caras en lugar de 6.
3. Volver a la rama main y modificar el código para realizar 6 lanzamientos.
4. Realizar el merge de los cambios de main en feature/rol.

### Actualización en GitHub
Asegúrate de que todos los cambios se suben al repositorio remoto en GitHub, ejecutando:
    ```
    git push origin main
    git push origin feature/rol
    ```


## Dockerización
Para garantizar la consistencia del entorno, hemos creado un archivo Dockerfile que define la imagen para ejecutar la aplicación. Los pasos para ejecutar la aplicación en Docker son los siguientes:

1. Construir la imagen:
    ```
    docker build -t simulador-dados .
    ```
2. Ejecutar el contenedor:
    ```
    docker run simulador-dados
    ```
