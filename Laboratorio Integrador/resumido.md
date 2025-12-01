# Script Trampa
ejecutar en terminal: "trampa"

luego ver que escribio: "cat /tmp/pista_trampa.txt"

## que esta pidiendo? ---> q revise permisos y todo lo q hizo el script osea:

1) Usuarios creados (grep -E 'alumno1|alumno2|nohome_user' /etc/passwd) 

2) Directorios y permisos raros ( ls -l /opt/lab_exercise  y ls -l /opt/lab_exercise/tmp_public )

3) Sticky bit ( ls -ld /opt/lab_exercise/tmp_public ) --> tengo q ver la t al final ( drwxrwxrw***t***)

4) Enlaces simbólicos (  readlink /opt/lab_exercise/broken_link y  readlink /opt/lab_exercise/link_to_mismatch ) 

5) Archivo inmutable (+i) ( lsattr /opt/lab_exercise/immutable_note.txt ) -----> deberia verse una ***i***

6) Cron que escribe cada minuto ( cat /etc/cron.d/lab_exercise y tail /var/tmp/lab_cron_marker.txt ) ---> ver cron y luego q escribe

7) Archivo root-only ( ls -l /opt/lab_exercise/root_only.txt ) ---> permiso debe ser 600 (solo root) 

8) Usuario sin home --> ( grep nohome_user /etc/passwd)
