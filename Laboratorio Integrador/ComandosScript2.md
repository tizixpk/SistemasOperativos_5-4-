---

#  Verificaciones adicionales 

---

## **1. Verificar el sticky-bit del directorio `tmp_public`**
Comprobar si el directorio `/opt/lab_exercise/tmp_public` tiene el **sticky-bit (modo 1777)**.

```bash
stat /opt/lab_exercise/tmp_public
```

* **1** = sticky-bit
* **7 7 7** = permisos rwx para todos
  El sticky-bit evita que un usuario borre archivos de otro dentro del directorio.

---

## **2. Verificar los enlaces simbólicos con `readlink`**
Mostrar hacia dónde apuntan los enlaces simbólicos creados.

```bash
readlink /opt/lab_exercise/broken_link
readlink /opt/lab_exercise/link_to_mismatch
```

* Si el destino **no existe**, es un enlace roto.
* `readlink` muestra la **ruta real del objetivo** del link.

---

## **3. Confirmar que `nohome_user` realmente NO tiene home**
Verificar que el usuario creado sin home efectivamente no tenga directorio personal.

```bash
getent passwd nohome_user
```

Debe mostrar algo como:

<img width="453" height="105" alt="{3696399D-9168-43EB-9CDB-4FF6482E6CDC}" src="https://github.com/user-attachments/assets/306b8288-aaea-43f1-aca9-4d92b118658f" />

si tuviera home diria asi: 

<img width="527" height="96" alt="{8B071D8D-7DF0-4603-A612-0A03E2CB28E3}" src="https://github.com/user-attachments/assets/2013ffa6-a3ee-4d93-826b-fa7b27b5ef51" />

---

## **4. Verificar atributo inmutable + probar borrado**
Comprobar si `immutable_note.txt` tiene atributo **+i** (no se puede borrar ni editar).

```bash
lsattr /opt/lab_exercise/immutable_note.txt
sudo rm /opt/lab_exercise/immutable_note.txt
```

* `lsattr` mostrará:

  ```
  ----i-------- immutable_note.txt
  ```

  La **i** significa *inmutable*.
* El intento de borrar debe fallar con:

  ```
  Operation not permitted
  ```

---

## **5. Buscar trazas del laboratorio en todo el sistema**
Listar cualquier archivo relacionado con el laboratorio.


```bash
sudo find / -name "*lab*" 2>/dev/null
```

Permite encontrar:

* backups
* scripts
* directorios
* logs
  Todo lo que tenga “lab” en el nombre.

---

## **6. Revisar permisos del directorio principal del laboratorio**
Comprobar permisos, dueño y grupo del directorio `/opt/lab_exercise`.

```bash
stat /opt/lab_exercise
```

Debe mostrar:

* Owner: **root**
* Group: **root**
* Access: **0755** → root rwx, otros rx

---

## **7. Obtener "stats" importantes de archivos clave**
Ver permisos completos, dueño, grupo, tamaño y fechas.

```bash
stat /opt/lab_exercise/root_only.txt
stat /opt/lab_exercise/owner_mismatch.txt
```

Estos comandos confirman:

* permisos
* dueño real
* grupo asignado
* fechas
* tipo de archivo

---

# 📌 permisos (chmod)

**Explicado ultra resumido**

| Número | Significado | Qué permite         |
| ------ | ----------- | ------------------- |
| **0**  | ---         | nada                |
| **1**  | --x         | ejecutar            |
| **2**  | -w-         | escribir            |
| **3**  | -wx         | escribir + ejecutar |
| **4**  | r--         | leer                |
| **5**  | r-x         | leer + ejecutar     |
| **6**  | rw-         | leer + escribir     |
| **7**  | rwx         | todo                |

---

# permisos típicos

## **660**

```
rw-rw----
```

* dueño: leer + escribir
* grupo: leer + escribir
* otros: nada
  **Se usa para archivos privados compartidos solo entre dueño y grupo.**

---

## **770**

```
rwxrwx---
```

* dueño: todo
* grupo: todo
* otros: nada
  **Se usa para carpetas compartidas solo entre miembros del grupo.**

---

## **600**

```
rw-------
```

Solo el dueño puede leer y escribir.
**Archivo súper privado** (como el `.secreto` del alumno2).

---

## **755**

```
rwxr-xr-x
```

* dueño: todo
* otros: leer + ejecutar
  **Típico para directorios del sistema o scripts públicos.**

---


