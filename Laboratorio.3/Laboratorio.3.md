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

```bash
ls /home
```

📸 *screenshot*

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

📸 *screenshot*

---

## 3. Crear usuario einstime sin directorio home y con shell /bin/sh

```bash
sudo useradd -M -s /bin/sh einstime
echo "einstime:einstime" | sudo chpasswd
```

### ¿Qué ocurre al loguearse?

No tiene entorno completo ni archivos personales; es útil para usuarios con permisos limitados, por ejemplo, scripts automatizados o tareas de sistema.
📸 *screenshot*

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

📸 *screenshot*

---

## 6. Deshabilitar contraseña del usuario serena

```bash
sudo cat /etc/shadow | grep serena
sudo passwd -d serena
sudo cat /etc/shadow | grep serena
```

📸 *screenshot*

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
📸 *screenshot*

---

## 9. Crear grupos tennis, football y sports

```bash
sudo groupadd tennis
sudo groupadd football
sudo groupadd sports
```

📸 *screenshot*

---

## 10. Añadir usuario venus a tennis (primario) y sports (secundario)

```bash
sudo usermod -g tennis venus
sudo usermod -a -G sports venus
```

📸 *screenshot*

---

## 11. Renombrar grupo football como foot

```bash
sudo groupmod -n foot football
```

📸 *screenshot*

---

## 12. Verificar que serena pertenece al grupo tennis

```bash
id serena
```

📸 *screenshot*

---

## 13. Forzar cambio de contraseña cada 10 días a serena

```bash
sudo chage -M 10 serena
```

📸 *screenshot*

---

## 14. Advertencia 4 días antes del vencimiento de clave para kornuser

```bash
sudo chage -W 4 kornuser
```

📸 *screenshot*

```

¿Querés que también lo suba a un archivo `.md` para descargar o pegar directamente en GitHub?
```
