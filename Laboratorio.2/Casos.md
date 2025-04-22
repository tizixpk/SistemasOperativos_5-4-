# Cuestionario - Casos

## CASO 1
La empresa para la cual trabajamos, nos ha pedido reiniciar el servicio de apache, para ello nos ha proporcionado los siguientes datos:

- **IP del servidor**: 192.168.3.254/24
- **Nombre del usuario remoto**: adminlog
- **Puerto de autenticación**: 123

### Capturas de Pantalla
1. **Comando `netstat -punta` mostrando la conexión con el servidor:**
 ![image](https://github.com/user-attachments/assets/773ae71a-877c-47fc-82cd-c1979178c456)


2. **Reinicio del servidor Apache (es necesario ser root):**
![image](https://github.com/user-attachments/assets/934d2370-c19b-428b-b81c-aa841f36e7c6)


---

## CASO 2
La misma empresa nos ha pedido copiar la carpeta de inventarios de la empresa la cual está hospedada en un servidor remoto, para ello nos ha proporcionado los siguientes datos:

- **IP del servidor**: 192.168.3.254/24
- **Nombre del usuario remoto**: adminlog
- **Puerto de autenticación**: 123
- **Ruta del Recurso Remoto**: /tmp/Conta

### Captura de Pantalla
- **Proceso de copia de la carpeta de inventarios:**
  ![image](https://github.com/user-attachments/assets/6d68101d-ef50-4fbf-8088-829ca7157d29)


---

## CASO 3
La misma empresa nos ha pedido copiar el archivo `inventarioEnero.xls` que se encuentra dentro de la ruta “/tmp/Conta/”, para ello nos ha proporcionado los siguientes datos:

- **IP del servidor remoto**: 192.168.3.254/24
- **Nombre del usuario remoto**: adminlog
- **Puerto de autenticación**: 123
- **Ruta del Recurso Remoto**: /tmp/Conta

### Captura de Pantalla
- **Proceso de copia del archivo `inventarioEnero.xls`:**
![image](https://github.com/user-attachments/assets/b05486c4-7043-416e-94b8-792857befb9c)


---

## CASO 4
Se nos ha pedido subir una actualización referente a la página web de la empresa, para ello nos ha proporcionado los siguientes datos:

- **IP del servidor remoto**: 192.168.3.254/24
- **Nombre del usuario remoto**: adminlog
- **Puerto de autenticación**: 123
- **Ruta del Servidor a donde se tiene que subir la información**: /home/adminlog/

### Captura de Pantalla
- **Proceso de subida de la actualización:**
![image](https://github.com/user-attachments/assets/7d75d437-6c24-449d-889d-1cc8a0cf9281)


---

## CASO 5
Se nos ha pedido subir una actualización referente a la página web de la empresa, pero esta vez será usando SFTP, para ello nos ha proporcionado los siguientes datos:

- **IP del servidor remoto**: 192.168.3.254/24
- **Nombre del usuario remoto**: adminlog
- **Puerto de autenticación**: 123
- **Ruta del Servidor a donde se tiene que subir la información**: /tmp/Conta

### Captura de Pantalla
- **Proceso de subida de la actualización usando SFTP:**

  capturaaa
---
