# Laboratorio 3 : Administración de usuarios y grupos  
**Autor:** Tiziano Pirez  
**Curso:** 5to 4ta  

---

## 1. Crear usuarios Serena Williams, Venus Williams y Justine Henin  
```bash
sudo useradd -m -c "Serena Williams" serena
sudo useradd -m -c "Venus Williams" venus
sudo useradd -m -c "Justine Henin" justine
echo "serena:stargate" | sudo chpasswd
echo "venus:stargate" | sudo chpasswd
echo "justine:stargate" | sudo chpasswd
````

Verificación:

```
ls /home

```
📸 ![image](https://github.com/user-attachments/assets/458b6ef8-dec8-4223-b0c9-ef1faab33f56)
---

## 2. Crear usuario kornuser con otro shell por defecto

```bash
sudo useradd -m -s /bin/sh kornuser
echo "kornuser:kornuser" | sudo chpasswd
```

Verificación:

```bash
cat /etc/shells
su - kornuser
```

📸 ![image](https://github.com/user-attachments/assets/13a8e107-e416-430e-a8ee-6e11b1a87e49)


---

## 3. Crear usuario einstime sin directorio home y con shell /bin/sh

```bash
sudo useradd -M -s /bin/sh einstime
echo "einstime:einstime" | sudo chpasswd
```

### ¿Qué ocurre al loguearse?

No tiene entorno completo ni archivos personales; es útil para usuarios con permisos limitados, por ejemplo, scripts automatizados o tareas de sistema.
📸 ![image](https://github.com/user-attachments/assets/578e65cc-0958-4bc5-8872-148657409fdd)


---

## 4. Comandos de exploración

* `who`: muestra quién está logueado.
* `whoami`: muestra el usuario actual.
* `w`: muestra usuarios conectados y sus procesos.
* `id`: muestra UID, GID y grupos del usuario.
* `echo $USER $UID`: muestra nombre y UID del usuario actual.

---

## 5. Bloquear usuario venus

```bash
sudo usermod -L venus
```

Verificación:

```bash
sudo passwd -S venus
```

📸 ![image](https://github.com/user-attachments/assets/f9265e27-6199-44cb-ac31-a838bed0175a)


---

## 6. Deshabilitar contraseña del usuario serena

```bash
sudo cat /etc/shadow | grep serena
sudo passwd -d serena
sudo cat /etc/shadow | grep serena
```

📸 ![image](https://github.com/user-attachments/assets/c3244300-49da-4acb-ab0f-529853f9c4a1)


---

## 7. Diferencia entre bloquear cuenta y deshabilitar contraseña

* **Bloquear**: impide todo acceso al usuario.
* **Deshabilitar contraseña**: permite iniciar sesión si hay otros métodos (por ejemplo, claves SSH).

---

## 8. Intentar cambiar contraseña de serena logueado como serena

```bash
su - serena
passwd
```

Descripción: Aparece error porque no tiene contraseña activa.
📸 ![image](https://github.com/user-attachments/assets/9df2fb79-4f1c-44fc-96e9-cb13765d2f43)


---

## 9. Crear grupos tennis, football y sports

```bash
sudo groupadd tennis
sudo groupadd football
sudo groupadd sports
```

📸 ![image](https://github.com/user-attachments/assets/c4ef6ebd-8fc5-4513-b300-4d705f6d4e52)


---

## 10. Añadir usuario venus a tennis (primario) y sports (secundario)

```bash
sudo usermod -g tennis venus
sudo usermod -a -G sports venus
```

📸 ![image](https://github.com/user-attachments/assets/ad1e3aa3-60f7-4294-859b-d95e6a877f50)


---

## 11. Renombrar grupo football como foot

```bash
sudo groupmod -n foot football
```

📸 ![image](https://github.com/user-attachments/assets/911b927e-cca0-4dd0-be24-9e13beba78d9)


---

## 12. Verificar que serena pertenece al grupo tennis

```bash
id serena
```

📸 ![image](https://github.com/user-attachments/assets/58d67e99-6fdd-4075-b190-e1d6bb52b9dc)


---

## 13. Forzar cambio de contraseña cada 10 días a serena

```bash
sudo chage -M 10 serena
```

📸 ![image](https://github.com/user-attachments/assets/49c4c753-139c-41ce-bedc-25d9323e93f1)


---

## 14. Advertencia 4 días antes del vencimiento de clave para kornuser

```bash
sudo chage -W 4 kornuser
```

📸 ![image](https://github.com/user-attachments/assets/514ee705-49e2-4179-ae22-b4a213597db1)


```

¿Querés que también lo suba a un archivo `.md` para descargar o pegar directamente en GitHub?
```
