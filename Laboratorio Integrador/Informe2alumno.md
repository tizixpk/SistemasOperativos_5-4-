## Verificar los cambios realizados
### Usuarios y grupos
Listar usuarios agregados recientemente:

bash
tail -n 5 /etc/passwd
getent passwd | grep alumno
Verificar si tienen directorio home:

bash
ls /home
Confirmar si alguna cuenta está bloqueada:

bash
sudo passwd -S alumno2
Verificar la existencia del usuario sin home:

bash
getent passwd nohome_user
3.2 Archivos y permisos
Listar archivos en la carpeta creada:

bash
ls -la /opt/lab_exercise
find /opt/lab_exercise -ls
Revisar permisos y propietarios:

bash
stat /opt/lab_exercise/root_only.txt
stat /opt/lab_exercise/owner_mismatch.txt
ls -l /opt/lab_exercise
Buscar enlaces simbólicos:

bash
ls -l /opt/lab_exercise | grep ^l
Probar enlaces rotos:

bash
file /opt/lab_exercise/broken_link
3.3 Tareas programadas (cron)
Verificar los archivos en /etc/cron.d:

bash
ls /etc/cron.d/
cat /etc/cron.d/lab_exercise
Revisar si el cron dejó marcas:

bash
tail -n 10 /var/tmp/lab_cron_marker.txt
Ver sus propias tareas cron:

bash
crontab -l
3.4 Configuración del sistema
Ver cambios en hosts (buscando marcas del laboratorio):

bash
cat /etc/hosts
Verificar si existe backup:

bash
ls /etc/hosts.bak.lab
3.5 Atributos especiales
Revisar si algún archivo es immutable:

bash
lsattr /opt/lab_exercise/immutable_note.txt
Intentar borrarlo:

bash
sudo rm /opt/lab_exercise/immutable_note.txt
3.6 Archivos y scripts sospechosos
Ver el script trampa y su efecto:

bash
ls -l /usr/local/bin/trampa
cat /usr/local/bin/trampa
sudo /usr/local/bin/trampa
cat /tmp/pista_trampa.txt
4. Consultar el log de cambios
Todos los scripts escriben en:

bash
cat /var/log/lab_changes.log
5. Restaurar el sistema
Para deshacer todos los cambios y dejar todo como estaba:

bash
sudo bash lab_cleanup.sh
Verifique que los cambios se revierten (usuarios eliminados, archivos y cron borrados, hosts restaurado):

Revisar nuevamente /etc/passwd, /opt/lab_exercise, /etc/hosts y /etc/cron.d
