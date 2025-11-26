# Informe del Laboratorio Integrador

**Alumno:** Tiziano Pirez  
**Curso:** 5° 4°  
**Fecha:** 27/10/2025  
**SO usado:** Ubuntu Linux (VM)

---

## 1. Usuarios creados

El script agrega tres usuarios nuevos al sistema:

| Usuario        | Home              | Shell       | Estado            |
|----------------|-------------------|-------------|-------------------|
| `alumno1`      | /home/alumno1     | /bin/bash   | Activo            |
| `alumno2`      | /home/alumno2     | /bin/bash   | Bloqueado         |
| `nohome_user`  | *(sin home)*      | /bin/bash   | Activo            |

### Comentario
- `alumno1` viene con un archivo de bienvenida.  
- `alumno2` existe pero se bloquea la contraseña ni bien se crea.  
- `nohome_user` se crea sin carpeta personal (`-M`).  
- Todos quedan registrados en `/etc/passwd` como corresponde.

---

## 2. Archivos y permisos en `/opt/lab_exercise`

Durante la ejecución del script aparecen varios archivos:

| Archivo/Dir                  | Propietario   | Permisos | Nota rápida |
|------------------------------|---------------|----------|-------------|
| `root_only.txt`              | root:root     | 600      | Solo root lo ve. |
| `tmp_public/`                | root:root     | 1777     | Carpeta pública tipo `/tmp`. |
| `tmp_public/readme.txt`      | root:root     | 644      | Archivo común. |
| `owner_mismatch.txt`         | root:alumno1  | 640      | Propietario raro a propósito. |
| `broken_link`                | —             | —        | Enlace roto. |
| `link_to_mismatch`           | —             | —        | Apunta al archivo anterior. |
| `immutable_note.txt`         | root:root     | 644 + i | Marcado como inmutable. |

### Comentario
- El directorio `tmp_public` está abierto para todos pero con sticky bit.  
- `owner_mismatch.txt` probablemente es para practicar detección de problemas de permisos.  
- El archivo `immutable_note.txt` tiene el flag `i` y no se puede editar ni borrar hasta usar `chattr -i`.

---

## 3. Cron configurado

Se crea el archivo:
/etc/cron.d/lab_exercise

Con el contenido:

	•		•		•		•		•	root echo “cron_mark: $(date -Iseconds)” >> /var/tmp/lab_cron_marker.txt

### Comentario
- Corre **una vez por minuto**.  
- Solo escribe una marca de tiempo.  
- No ejecuta scripts externos, así que es seguro.

---

## 4. Cambios en `/etc/hosts`

El script agrega:

LAB_EXERCISE_ENTRIES

127.0.0.1    servicio-interno.local
192.0.2.123  servicio-falso.example

LAB_EXERCISE_ENTRIES

### Comentario
- No borra lo que ya estaba, solo suma estas líneas.  
- Son dominios falsos para pruebas de redirección.

---

## 5. Atributos especiales

Archivo afectado:

/opt/lab_exercise/immutable_note.txt

Con atributo:

––i–––– immutable_note.txt

### Comentario
- El `i` significa **inmutable**: no se puede editar, mover ni borrar.  
- Para revertirlo:  

sudo chattr -i immutable_note.txt

---

