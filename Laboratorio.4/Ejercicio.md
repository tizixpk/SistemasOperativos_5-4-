## **Laboratorio #4 - Permisos - Usuarios y Grupos**

**Nombre y Apellido:** Tiziano Pirez  
**Curso:** 5"4  
**Fecha:** 12 de mayo, 2025  


## **1. Creación de Usuarios y Grupos**

**Actividades:**

- **Crear el usuario `kevin`:**

  ```bash
  sudo useradd  -m -s  /bin/bash kevin
   ```
     ![image](https://github.com/user-attachments/assets/94b5cc8b-bc4f-46b0-bda3-11a8e7e90641)


* **Verificar su existencia en el archivo `/etc/passwd`:**

  ```bash
  grep kevin /etc/passwd
  ```
     ![image](https://github.com/user-attachments/assets/0f2d827d-8b7f-4a6c-a631-c60485a59965)


* **Iniciar sesión como `kevin` y mostrar su información con `id`:**

  ```bash
  su - kevin
  id
  ```
     ![image](https://github.com/user-attachments/assets/e2738f6e-1e97-4ad0-8e2a-c440dfebf8a5)


* **Crear el usuario `mitnick` con un UID específico y su propio grupo:**

  ```bash
  sudo useradd -u 1050 -m -U mitnick
  ```
     ![image](https://github.com/user-attachments/assets/37d4d1f1-14ca-41a4-84a7-055e9347543e)


* **Asignar contraseña a `mitnick`:**

  ```bash
  sudo passwd mitnick
  ```
     ![image](https://github.com/user-attachments/assets/38d8fe14-2448-4041-88c9-9d822a1dfe80)


* **Crear el grupo `agentes`:**

  ```bash
  sudo groupadd agentes
  ```
     ![image](https://github.com/user-attachments/assets/0ccd8dd4-f71d-402d-93cd-f7c41d6c3663)


* **Añadir a `kevin` y `mitnick` al grupo `agentes`:**

  ```bash
  sudo usermod -aG agentes kevin
  sudo usermod -aG agentes mitnick
  ```
     ![image](https://github.com/user-attachments/assets/f50537ea-6b99-4331-8243-5d8cc64065cd)


* **Hacer que `mitnick` sea el administrador del grupo `agentes`:**

  ```bash
  sudo gpasswd -A mitnick agentes
  ```
     ![image](https://github.com/user-attachments/assets/97b8177a-b2a6-42d2-857f-43bc86610ae0)


---

### **2. Comprobaciones y Cambios de Grupo**

**Actividades:**

* **Mostrar los grupos a los que pertenecen `kevin` y `mitnick`:**

  ```bash
  groups kevin
  groups mitnick
  ```
     ![image](https://github.com/user-attachments/assets/60cf12fd-a20e-4c05-b96f-c86b751d215f)


* **Crear un archivo `primero` como `kevin` y cambiarle el grupo a `agentes`:**

  ```bash
  su - kevin
  touch primero
  chgrp agentes primero
  ```
     ![image](https://github.com/user-attachments/assets/5100d25f-2b39-4b0a-b8fd-5392620bd594)


* **Cambiar el grupo principal de `kevin` a `agentes`:**

  ```bash
  sudo usermod -g agentes kevin
  ```
     ![image](https://github.com/user-attachments/assets/aa4f6047-bffc-492a-b2a8-4e41256f1420)


* **Crear un archivo `segundo`, cambiarle el grupo a `kevin`:**

  ```bash
  touch segundo
  chgrp kevin segundo
  ```
     ![image](https://github.com/user-attachments/assets/a0e396ba-3dc9-48c0-8a1b-7f84956f5111)


* **Restaurar el grupo principal de `kevin` a `kevin`:**

  ```bash
  sudo usermod -g kevin kevin
  ```
     ![image](https://github.com/user-attachments/assets/9f79bf37-125a-4e0f-88af-4b665d6aa74d)


---

### **3. Control de Acceso a Archivos**

**Actividades:**

* **Como `kevin`, crear un archivo con contenido sensible y modificar sus permisos:**

  ```bash
  su - kevin
  echo "Contenido sensible" > archivo_sensible
  chmod 600 archivo_sensible
  ```

* **Como `mitnick`, intentar acceder al archivo:**

  ```bash
  su - mitnick
  cat /home/kevin/archivo_sensible
  ```

* **Restringir aún más los permisos y volver a probar el acceso:**

  ```bash
  chmod 400 /home/kevin/archivo_sensible
  cat /home/kevin/archivo_sensible
  ```

---

### **4. Archivos Compartidos del Grupo Agentes**

**Actividades:**

* **Crear el archivo `mision`, asignarlo al grupo `agentes` y dar permisos adecuados:**

  ```bash
  touch mision
  chgrp agentes mision
  chmod 770 mision
  ```

* **Verificar si `mitnick` puede leer el archivo `mision`:**

  ```bash
  su - mitnick
  cat /home/kevin/mision
  ```

---

### **5. Usuario Adele y Gestión de Grupo**

**Actividades:**

* **Crear el usuario `adele` y añadirlo al grupo `agentes`:**

  ```bash
  sudo useradd -m adele
  sudo usermod -aG agentes adele
  ```

* **Crear el directorio `/expedientes` y asignarlo a `mitnick` y grupo `agentes`:**

  ```bash
  sudo mkdir /expedientes
  sudo chown mitnick:agentes /expedientes
  ```

* **Crear un archivo secreto en `/expedientes` con contenido delicado:**

  ```bash
  echo "Contenido secreto" | sudo tee /expedientes/secreto > /dev/null
  sudo chmod 600 /expedientes/secreto
  ```

* **Eliminar a `adele` del grupo `agentes`:**

  ```bash
  sudo gpasswd -d adele agentes
  ```

---

### **6. Pruebas de Acceso con Permisos**

**Actividades:**

* **Modificar los permisos de `/expedientes` y su contenido para probar accesos:**

  ```bash
  sudo chmod 770 /expedientes
  sudo chmod 600 /expedientes/secreto
  ```

* **Asignar permisos para que solo el grupo pueda acceder:**

  ```bash
  sudo chmod 770 /expedientes
  sudo chmod 660 /expedientes/secreto
  ```

---

### **7. Protección contra Borrado**

**Actividades:**

* **Probar eliminación de archivos por otros miembros del grupo:**

  ```bash
  sudo rm /expedientes/secreto
  ```

* **Activar el sticky bit en `/expedientes`:**

  ```bash
  sudo chmod +t /expedientes
  ```

---

### **8. Usuario Ofelia y Grupo Temporal**

**Actividades:**

* **Crear el usuario `ofelia`:**

  ```bash
  sudo useradd -m ofelia
  ```

* **Cambiar temporalmente al grupo `agentes` con `newgrp`:**

  ```bash
  su - ofelia
  newgrp agentes
  ```

---

### **9. Compilación del Programa Manipular**

**Actividades:**

* **Compilar un programa llamado `manipular` desde `manipular.cc`:**

  ```bash
  g++ manipular.cc -o manipular
  ```

* **Copiarlo a `/usr/bin` y asignarle propiedad:**

  ```bash
  sudo cp manipular /usr/bin/
  sudo chown root:root /usr/bin/manipular
  ```

* **Usar el programa para escribir un archivo:**

  ```bash
  /usr/bin/manipular > /home/kevin/archivo.txt
  chmod 600 /home/kevin/archivo.txt
  ```

---

### **10. Bit setuid y setgid**

**Actividades:**

* **Activar el bit `setuid` en `manipular`:**

  ```bash
  sudo chmod u+s /usr/bin/manipular
  ```

* **Probar que otros usuarios lo usen para leer archivos restringidos:**

  ```bash
  su - mitnick
  manipular /expedientes/secreto
  ```

* **Quitar `setuid` y aplicar `setgid` con grupo `agentes`:**

  ```bash
  sudo chmod u-s /usr/bin/manipular
  sudo chgrp agentes /usr/bin/manipular
  sudo chmod g+s /usr/bin/manipular
  ```

* **Verificar el acceso a `/expedientes/ficherosecreto`:**

  ```bash
  su - mitnick
  manipular /expedientes/ficherosecreto
  ```

---

