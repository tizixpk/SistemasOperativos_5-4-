# cuestionario-laboratorio-ssh.docx

**Autor: Tiziano Pirez Elias Rod 5°4**

---

### 1. Describir tres usos del protocolo de red Secure Shell (SSH)  
**Respuesta:**  
- Conectarse a equipos remotos para tareas administrativas.  
- Copiar datos de forma segura.  
- Tunelizar datos de otras aplicaciones por un canal seguro.  
*Fuente: pág. 4*

---

### 2. ¿SSH o Telnet? ¿Por qué?  
**Respuesta:**  
SSH, porque proporciona cifrado asimétrico para la comunicación, lo que garantiza la seguridad, a diferencia de Telnet que transmite datos sin cifrado.  
*Fuente: pág. 3-4*

---

### 3. ¿Cuáles son los sistemas operativos que soportan el protocolo SSH?  
**Respuesta:**  
Linux y sistemas compatibles con TCP/IP, como se evidencia por el uso de Debian y entornos como OpenBSD en el texto.  
*Fuente: pág. 5*

---

### 4. ¿Qué tipo de criptografía utiliza el protocolo de red Secure Shell (SSH)?  
**Respuesta:**  
Criptografía asimétrica. Utiliza un par de claves: una pública para cifrar y una privada para descifrar.  
*Fuente: pág. 3*

---

### 5. ¿Qué puerto TCP estándar se asigna para contactar con los servidores SSH?  
**Respuesta:**  
El puerto 22.  
*Fuente: pág. 4*

---

### 6. Además de SSH, investiga los protocolos que permiten iniciar sesión en un servidor remoto.  
**Respuesta:**  
Telnet es otro protocolo que permite iniciar sesión en un servidor remoto, aunque sin cifrado.  
*Fuente: inferido del contexto del documento*

---

### 7. ¿Cuáles son los protocolos de transferencia de archivos mediante SSH?  
**Respuesta:**  
SCP y SFTP.  
*Fuente: pág. 5, 21, 23*

---

### 8. ¿Cuáles son métodos de autenticación que utiliza SSH?  
**Respuesta:**  
Autenticación mediante clave pública/privada, y por contraseña de usuario.  
*Fuente: pág. 3 y 8*

---

### 9. ¿Cuál es el archivo que se debe modificar para cambiar el puerto por defecto?  
**Respuesta:**  
El archivo `/etc/ssh/sshd_config`.  
*Fuente: pág. 10-11*

---

### 10. ¿Qué parámetro debemos configurar para dar una mayor seguridad al servicio?  
**Respuesta:**  
Deshabilitar el acceso root (`PermitRootLogin no`), activar `StrictModes yes`, y definir `MaxAuthTries`.  
*Fuente: pág. 12-14*

---

### 11. ¿Qué comando se utiliza para reiniciar el servidor SSH?  
**Respuesta:**  
`systemctl restart sshd` o `/etc/init.d/sshd restart`  
*Fuente: pág. 15*
