---

# ✅ Verificaciones adicionales 

---

## **1. Verificar el sticky-bit del directorio `tmp_public`**

### **Enunciado**

Comprobar si el directorio `/opt/lab_exercise/tmp_public` tiene el **sticky-bit (modo 1777)**.

### **Comando**

```bash
stat /opt/lab_exercise/tmp_public
```

### **Explicación**

En "Access: (1777/...)" debe verse:

* **1** = sticky-bit
* **7 7 7** = permisos rwx para todos
  El sticky-bit evita que un usuario borre archivos de otro dentro del directorio.

---

## **2. Verificar los enlaces simbólicos con `readlink`**

### **Enunciado**

Mostrar hacia dónde apuntan los enlaces simbólicos creados.

### **Comandos**

```bash
readlink /opt/lab_exercise/broken_link
readlink /opt/lab_exercise/link_to_mismatch
```

### **Explicación**

* Si el destino **no existe**, es un enlace roto.
* `readlink` muestra la **ruta real del objetivo** del link.

---

## **3. Confirmar que `nohome_user` realmente NO tiene home**

### **Enunciado**

Verificar que el usuario creado sin home efectivamente no tenga directorio personal.

### **Comando**

```bash
getent passwd nohome_user
```

### **Explicación**

Debe mostrar algo como:

```
nohome_user:x:1003:1003::/home:/bin/bash
```

El campo entre los dos últimos ":" debería estar **vacío o "/"**, indicando **sin directorio home**.

---

## **4. Verificar atributo inmutable + probar borrado**

### **Enunciado**

Comprobar si `immutable_note.txt` tiene atributo **+i** (no se puede borrar ni editar).

### **Comandos**

```bash
lsattr /opt/lab_exercise/immutable_note.txt
sudo rm /opt/lab_exercise/immutable_note.txt
```

### **Explicación**

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

### **Enunciado**

Listar cualquier archivo relacionado con el laboratorio.

### **Comando**

```bash
sudo find / -name "*lab*" 2>/dev/null
```

### **Explicación**

Permite encontrar:

* backups
* scripts
* directorios
* logs
  Todo lo que tenga “lab” en el nombre.

---

## **6. Revisar permisos del directorio principal del laboratorio**

### **Enunciado**

Comprobar permisos, dueño y grupo del directorio `/opt/lab_exercise`.

### **Comando**

```bash
stat /opt/lab_exercise
```

### **Explicación**

Debe mostrar:

* Owner: **root**
* Group: **root**
* Access: **0755** → root rwx, otros rx

---

## **7. Obtener "stats" importantes de archivos clave**

### **Enunciado**

Ver permisos completos, dueño, grupo, tamaño y fechas.

### **Comandos**

```bash
stat /opt/lab_exercise/root_only.txt
stat /opt/lab_exercise/owner_mismatch.txt
```

### **Explicación**

Estos comandos confirman:

* permisos
* dueño real
* grupo asignado
* fechas
* tipo de archivo

---

# 📌 Resumen de permisos (chmod)

**Explicado ultra resumido para examen**

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

# 📌 Explicación de permisos típicos

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


