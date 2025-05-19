
---

## **Laboratorio #4 - Permisos - Usuarios y Grupos**

**Nombre y Apellido:** Tiziano Pirez
**Curso:** 5"4
**Fecha:** 12 de mayo, 2025

## Descripción

Práctica de gestión de usuarios, grupos y permisos en un sistema Linux, con actividades que incluyen la creación de usuarios y grupos, el control de acceso a archivos, la protección contra borrado, y el uso de permisos especiales como `setuid` y `setgid`.

---

### **1. Creación de Usuarios y Grupos**

**Actividades:**

* **Crear el usuario `kevin`:**

  ```bash
  sudo useradd kevin
  ```

* **Verificar su existencia en el archivo `/etc/passwd`:**

  ```bash
  cat /etc/passwd | grep kevin
  ```

* **Iniciar sesión como `kevin` y mostrar su información con `id`:**

  ```bash
  su - kevin
  id
  ```

* **Crear el usuario `mitnick` con un UID específico y su propio grupo:**

  ```bash
  sudo useradd -u 1050 -G mitnick mitnick
  ```

* **Asignar contraseña a `mitnick`:**

  ```bash
  sudo passwd mitnick
  ```

* **Crear el grupo `agentes`:**

  ```bash
  sudo groupadd agentes
  ```

* **Añadir a `kevin` y `mitnick` al grupo `agentes`:**

  ```bash
  sudo usermod -aG agentes kevin
  sudo usermod -aG agentes mitnick
  ```

* **Hacer que `mitnick` sea el administrador del grupo `agentes`:**

  ```bash
  sudo gpasswd -A mitnick agentes
  ```

---

### **2. Comprobaciones y Cambios de Grupo**

**Actividades:**

* **Mostrar los grupos a los que pertenecen `kevin` y `mitnick`:**

  ```bash
  groups kevin
  groups mitnick
  ```

* **Crear un archivo `primero` como `kevin`, cambiarle el grupo a `agentes`:**

  ```bash
  su - kevin
  touch primero
  chgrp agentes primero
  ```

* **Cambiar el grupo principal de `kevin` a `agentes`:**

  ```bash
  sudo usermod -g agentes kevin
  ```

* **Crear un archivo `segundo`, cambiarle el grupo a `kevin`:**

  ```bash
  touch segundo
  chgrp kevin segundo
  ```

* **Restaurar el grupo principal de `kevin` a `kevin`:**

  ```bash
  sudo usermod -g kevin kevin
  ```

---

### **3. Control de Acceso a Archivos**

**Actividades:**

* **Como `kevin`, crear un archivo con contenido sensible y modificar sus permisos para que sólo él pueda escribirlo:**

  ```bash
  su - kevin
  echo "Contenido sensible" > archivo_sensible
  chmod 600 archivo_sensible
  ```

* **Como `mitnick`, intentar acceder al archivo:**

  ```bash
  su - mitnick
  cat archivo_sensible
  ```

* **Restringir aún más los permisos y volver a probar el acceso:**

  ```bash
  chmod 400 archivo_sensible
  cat archivo_sensible
  ```

---

### **4. Archivos Compartidos del Grupo Agentes**

**Actividades:**

* **Crear un archivo `mision`, asignarlo al grupo `agentes` y dar permisos adecuados:**

  ```bash
  touch mision
  chgrp agentes mision
  chmod 770 mision
  ```

* **Verificar si `mitnick` puede leer el archivo `mision`:**

  ```bash
  su - mitnick
  cat mision
  ```

---

### **5. Usuario Adele y Gestión de Grupo**

**Actividades:**

* **Crear el usuario `adele` y añadirlo al grupo `agentes`:**

  ```bash
  sudo useradd adele
  sudo usermod -aG agentes adele
  ```

* **Crear el directorio `/expedientes` y asignar su propiedad a `mitnick` y su grupo a `agentes`:**

  ```bash
  sudo mkdir /expedientes
  sudo chown mitnick:agentes /expedientes
  ```

* **Crear un archivo secreto en `/expedientes` con contenido delicado:**

  ```bash
  sudo touch /expedientes/secreto
  sudo echo "Contenido secreto" > /expedientes/secreto
  sudo chmod 600 /expedientes/secreto
  ```

* **Eliminar a `adele` del grupo `agentes`:**

  ```bash
  sudo gpasswd -d adele agentes
  ```

---

### **6. Pruebas de Acceso con Permisos**

**Actividades:**

* **Modificar los permisos de `/expedientes` y su contenido para probar accesos como otros usuarios:**

  ```bash
  sudo chmod 770 /expedientes
  sudo chmod 600 /expedientes/secreto
  ```

* **Asignar permisos para que sólo miembros del grupo `agentes` puedan acceder:**

  ```bash
  sudo chmod 770 /expedientes
  sudo chmod 660 /expedientes/secreto
  ```

---

### **7. Protección contra Borrado**

**Actividades:**

* **Probar la eliminación de archivos por otros miembros del grupo:**

  ```bash
  sudo rm /expedientes/secreto
  ```

* **Activar el sticky bit en `/expedientes` y verificar su efecto al intentar borrar archivos:**

  ```bash
  sudo chmod +t /expedientes
  ```

---

### **8. Usuario Ofelia y Grupo Temporal**

**Actividades:**

* **Crear el usuario `ofelia`:**

  ```bash
  sudo useradd ofelia
  ```

* **Iniciar sesión con `ofelia` y cambiar temporalmente al grupo `agentes` usando `newgrp`:**

  ```bash
  su - ofelia
  newgrp agentes
  ```

---

### **9. Compilación del Programa Manipular**

**Actividades:**

* **Compilar un programa llamado `manipular` desde un archivo fuente `manipular.cc`:**

  ```bash
  g++ manipular.cc -o manipular
  ```

* **Copiarlo a `/usr/bin` y asignarle propiedad:**

  ```bash
  sudo cp manipular /usr/bin
  sudo chown root:root /usr/bin/manipular
  ```

* **Usar el programa para escribir un archivo en el directorio personal:**

  ```bash
  manipular > /home/kevin/archivo.txt
  ```

* **Proteger el archivo generado con permisos:**

  ```bash
  chmod 600 /home/kevin/archivo.txt
  ```

---

### **10. Bit setuid y setgid**

**Actividades:**

* **Activar el bit `setuid` en el programa `manipular`:**

  ```bash
  sudo chmod u+s /usr/bin/manipular
  ```

* **Probar que otros usuarios pueden usarlo para leer archivos restringidos:**

  ```bash
  su - mitnick
  manipular /expedientes/secreto
  ```

* **Quitar `setuid` y aplicar `setgid` con grupo `agentes`:**

  ```bash
  sudo chmod u-s /usr/bin/manipular
  sudo chmod g+s /usr/bin/manipular
  ```

* **Verificar el acceso al archivo `/expedientes/ficherosecreto` usando el bit `setgid`:**

  ```bash
  su - mitnick
  manipular /expedientes/ficherosecreto
  ```

---


