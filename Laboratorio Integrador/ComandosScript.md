## Verificar los cambios realizados

### Usuarios y grupos

**Listar usuarios agregados recientemente:**

`tail -n 5 /etc/passwd ` o `Cat /etc/passwd` 

<img width="818" height="154" alt="{2F35E665-9B76-4400-894E-3A6885CFEB51}" src="https://github.com/user-attachments/assets/66b432c1-834c-451f-b00c-c55ee46cdd5f" />


`getent passwd | grep alumno` -----> hace una lista de los usuarios alumno

<img width="735" height="72" alt="{6468EAAA-AD46-4058-B6D3-33AF7C9DC6B9}" src="https://github.com/user-attachments/assets/57f7732b-0b2e-4d5a-a8b4-a57dc183d658" />


**Verificar si tienen directorio home:**

`ls /home` -------> abajo en la cap se ve que solo alumno 1 y alumno 2 tienen home

<img width="558" height="44" alt="{232B94C7-3D51-4FF5-8F0D-FF138404C20B}" src="https://github.com/user-attachments/assets/a440d5ca-b212-4b85-8a38-0eaf7dee8630" />


**Confirmar si alguna cuenta está bloqueada:**

`sudo passwd -S alumno2` -----> si aparece L ( bloqueada), P ( abierto )

<img width="673" height="45" alt="{0D85EABF-BA61-464B-951E-57EFBD07071B}" src="https://github.com/user-attachments/assets/ac5356b0-5aea-4129-8ae1-9b00712a66c2" />


**Verificar la existencia del usuario sin home:**

`getent passwd nohome_user`   ------> aparece que tiene home y bin y bash

<img width="682" height="44" alt="{C6E6612C-D916-4A9B-8A30-852A946F0426}" src="https://github.com/user-attachments/assets/36e43014-f456-4b45-9a04-f8a932877aa5" />


### Archivos y permisos


**Listar archivos en la carpeta creada:**

`ls -la /opt/lab_exercise` ------>  muestra todos los archivos y directorios, incluidos ocultos, con sus permisos, dueños y tipo dentro de esa carpeta.

<img width="815" height="244" alt="{A14D80D2-5CA8-4979-8506-DF855181D523}" src="https://github.com/user-attachments/assets/8542dc17-ff96-42c2-9501-e655d716b1d0" />


`find /opt/lab_exercise -ls` -----> busca y lista todo, muestra detalles completos de cada archivo: permisos, dueño, tamaño, fecha y ruta.

<img width="1288" height="224" alt="{8F67A4CB-C367-474A-85C2-FD67AA6A315C}" src="https://github.com/user-attachments/assets/cc08c98a-f3a6-4e44-ab4d-9cebfa669bb1" />


**Revisar permisos y propietarios:**

`stat /opt/lab_exercise/root_only.txt` -------> no puse cap pero el --rw q hay significa q pertenece a root y tiene permisos solo para root y pertenece fecha y hora

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
