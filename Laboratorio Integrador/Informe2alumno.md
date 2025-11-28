## Verificar los cambios realizados

### Usuarios y grupos

**Listar usuarios agregados recientemente:**

`tail -n 5 /etc/passwd ` o `Cat /etc/passwd`

<img width="818" height="154" alt="{2F35E665-9B76-4400-894E-3A6885CFEB51}" src="https://github.com/user-attachments/assets/66b432c1-834c-451f-b00c-c55ee46cdd5f" />


`getent passwd | grep alumno`

**Verificar si tienen directorio home:**

`ls /home`

**Confirmar si alguna cuenta está bloqueada:**

`sudo passwd -S alumno2` -----> si aparece L ( bloqueada), P ( abierto )

**Verificar la existencia del usuario sin home:**

`getent passwd nohome_user`

### Archivos y permisos


**Listar archivos en la carpeta creada:**

`ls -la /opt/lab_exercise`

`find /opt/lab_exercise -ls`

**Revisar permisos y propietarios:**

`stat /opt/lab_exercise/root_only.txt`

`stat /opt/lab_exercise/owner_mismatch.txt`

`ls -l /opt/lab_exercise`


**Buscar enlaces simbólicos:**

`ls -l /opt/lab_exercise | grep ^l`


Probar enlaces rotos:

`file /opt/lab_exercise/broken_link`


### Tareas programadas (cron)

**Verificar los archivos en /etc/cron.d:**

`ls /etc/cron.d/`

`cat /etc/cron.d/lab_exercise`

**Revisar si el cron dejó marcas:**

`tail -n 10 /var/tmp/lab_cron_marker.txt`

**Ver sus propias tareas cron:**

`crontab -l`

### Configuración del sistema

**Ver cambios en hosts (buscando marcas del laboratorio):**

`cat /etc/hosts`

**Verificar si existe backup:**

`ls /etc/hosts.bak.lab`

### Atributos especiales

**Revisar si algún archivo es immutable:**

`lsattr /opt/lab_exercise/immutable_note.txt`

**Intentar borrarlo:**

`sudo rm /opt/lab_exercise/immutable_note.txt`

###  Archivos y scripts sospechosos

**Ver el script trampa y su efecto:**

`ls -l /usr/local/bin/trampa`

`cat /usr/local/bin/trampa`

`sudo /usr/local/bin/trampa`

`cat /tmp/pista_trampa.txt`

### Consultar el log de cambios:

**Todos los scripts escriben en:**

`cat /var/log/lab_changes.log`

### Restaurar el sistema

** Para deshacer todos los cambios y dejar todo como estaba:**

`sudo bash lab_cleanup.sh`


Revisar nuevamente `/etc/passwd`, `/opt/lab_exercise,` `/etc/hosts` y `/etc/cron.d`
