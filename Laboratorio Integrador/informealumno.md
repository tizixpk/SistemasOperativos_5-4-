# 🧪 Informe del Laboratorio: Descubriendo Cambios en el Sistema

**Alumno:** Tiziano Pirez
**Curso:** 5º 4ª
**Fecha:** 27/10/2025
**Sistema Operativo:** Ubuntu Linux (entorno de laboratorio / máquina virtual)

## 1️⃣ Usuarios

**Usuarios nuevos creados:**

| Usuario      | Home               | Shell               | Estado    |
| ------------ | ------------------ | ------------------- | --------- |
| `alumno_lab` | `/home/alumno_lab` | `/bin/bash`         | Activo    |
| `sinhome`    | *sin home*         | `/usr/sbin/nologin` | Bloqueado |
| `backup`     | `/home/backup`     | `/bin/bash`         | Activo    |

🔍 **Análisis:**

* El usuario `alumno_lab` fue creado para pruebas, con su directorio `/home/alumno_lab` y shell interactivo.
* El usuario `sinhome` no tiene home ni acceso a la terminal (`nologin`), por lo que está bloqueado.
* `backup` parece ser un usuario de mantenimiento o copia, también con acceso bash.
* Se detectaron nuevas líneas en `/etc/passwd` y `/etc/shadow` con estos usuarios.

---

## 2️⃣ Archivos y permisos

**Archivos inspeccionados en `/opt/lab_exercise`:**

| Archivo                           | Propietario             | Permisos             | Observación                      |
| --------------------------------- | ----------------------- | -------------------- | -------------------------------- |
| `/opt/lab_exercise/secret.txt`    | `root:root`             | `600`                | Solo root puede leerlo           |
| `/opt/lab_exercise/public.txt`    | `alumno_lab:alumno_lab` | `777`                | Demasiado abierto (riesgo)       |
| `/opt/lab_exercise/important.cfg` | `root:root`             | `644` + atributo `i` | Inmutable (no puede modificarse) |

🔍 **Análisis:**

* Se cambió el propietario de algunos archivos a `root`, posiblemente por error.
* `public.txt` con permiso `777` es un riesgo, ya que cualquier usuario puede modificarlo o borrar información.
* `important.cfg` tiene el atributo `immutable`, por lo que no puede editarse ni eliminarse hasta quitarle el flag (`sudo chattr -i`).

---

## 3️⃣ Cron jobs

**Cron detectado:** `/etc/cron.d/lab_exercise`

```
*/5 * * * * root /usr/local/bin/trampa
```

🔍 **Análisis:**

* Se ejecuta cada 5 minutos como **root**, llamando al script `/usr/local/bin/trampa`.
* Este cron deja rastros en `/var/log/lab_cron.log`.
* Riesgo: cualquier modificación en `/usr/local/bin/trampa` podría ejecutarse con permisos administrativos.

---

## 4️⃣ Configuración del sistema

**Archivo:** `/etc/hosts`

Antes:

```
127.0.0.1   localhost
```

Después del script:

```
127.0.0.1   localhost
127.0.0.1   www.google.com  # LAB_EXERCISE_ENTRY
192.168.56.10 internal.lab.local
```

🔍 **Análisis:**

* El script redirige `www.google.com` a `127.0.0.1`, bloqueando el acceso real al sitio.
* También agrega un dominio local `internal.lab.local`.
* Esto podría usarse para simular entornos internos o, en casos maliciosos, para redirigir tráfico de usuarios.

---

## 5️⃣ Atributos especiales

**Archivo con atributo `immutable`:**

```
/opt/lab_exercise/important.cfg
```

**Comando:**

```bash
lsattr /opt/lab_exercise/important.cfg
```

Salida:

```
----i-------- /opt/lab_exercise/important.cfg
```

🔍 **Análisis:**

* El atributo `i` impide modificar, borrar o mover el archivo.
* Si se intenta editar o eliminar, el sistema devuelve:
  `rm: cannot remove 'important.cfg': Operation not permitted`
* Para revertirlo: `sudo chattr -i /opt/lab_exercise/important.cfg`

---

## 6️⃣ Archivos de sistema

**Archivo:** `/usr/local/bin/trampa`

**Contenido principal:**

```bash
#!/bin/bash
# Script de prueba creado por lab_changes.sh
echo "$(date) - Cron ejecutado correctamente" >> /var/log/lab_cron.log
touch /tmp/lab_marker.txt
```

🔍 **Análisis:**

* El script se ejecuta periódicamente por el cron (cada 5 min).
* Registra fecha/hora en `/var/log/lab_cron.log` y crea un marcador en `/tmp/lab_marker.txt`.
* Si se modifica este archivo, cualquier comando dentro podría ejecutarse como root por el cron.
  ➡️ **Riesgo alto de seguridad.**

---

## 7️⃣ Conclusiones y recomendaciones

**Impacto en un sistema posta:**

* Creación de usuarios innecesarios puede abrir puertas a accesos indebidos.
* Archivos con permisos 777 permiten escritura a cualquiera.
* Cron jobs como root ejecutando scripts modificables son una grave vulnerabilidad.
* Cambios en `/etc/hosts` pueden alterar o bloquear sitios.
* Atributos `immutable` dificultan mantenimiento o eliminación de archivos.

**Medidas preventivas :**

* Auditar periódicamente `/etc/passwd`, `/etc/group` y `/etc/cron.*`.
* Usar `lsattr` para detectar atributos inusuales en archivos del sistema.
* Monitorear cambios con `auditd` o `inotify`.
* Evitar que scripts sean ejecutables por root si no son necesarios.
* Mantener copias de seguridad y snapshots antes de ejecutar scripts de administración.
* Controlar permisos (ningún archivo debería quedar con `777`).

---

 **Estado final:**
Se ejecutó `sudo bash lab_cleanup.sh` para revertir los cambios.
Verificado: usuarios eliminados, cron borrado, `/etc/hosts` restaurado, archivos limpiados.
Logs confirmados en `/var/log/lab_changes.log`.

---
