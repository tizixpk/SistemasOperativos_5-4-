
---

# **Protocolo Secure Shell (SSH)**
### Pirez Tiziano Rod Elias 5.4
---

## **1. Tres usos del protocolo SSH**

1. **Acceso remoto seguro**: SSH permite a los usuarios conectarse de forma segura a servidores remotos para realizar tareas administrativas, ejecutar comandos y gestionar sistemas de manera remota, todo ello a través de una conexión cifrada.

2. **Túneles seguros**: SSH puede crear túneles seguros para redirigir el tráfico de red a través de una conexión cifrada. Esto es útil para proteger datos sensibles que se envían a través de redes inseguras, como en el caso de acceder a servicios internos de una red corporativa desde fuera.

3. **Transferencia de archivos segura**: SSH permite la transferencia de archivos de manera segura mediante protocolos como SCP (Secure Copy Protocol) y SFTP (SSH File Transfer Protocol), asegurando que los datos estén cifrados durante la transmisión.

---

## **2. ¿SSH o Telnet? ¿Por qué?**

SSH es preferible a Telnet porque SSH proporciona una conexión cifrada, lo que significa que los datos transmitidos, incluidas las credenciales de inicio de sesión, están protegidos contra la interceptación. Telnet, por otro lado, transmite datos en texto claro, lo que lo hace vulnerable a ataques de "hombre en el medio" y otras formas de espionaje.

---

## **3. Sistemas operativos que soportan el protocolo SSH**

SSH es compatible con una amplia variedad de sistemas operativos, incluidos:

- **Linux**
- **macOS**
- **Windows** (a través de herramientas como OpenSSH o PuTTY)
- **BSD** (FreeBSD, OpenBSD, NetBSD)
- **Solaris**

---

## **4. Tipo de criptografía utilizada por SSH**

SSH utiliza criptografía de clave pública y privada para la autenticación y el establecimiento de conexiones seguras. También emplea algoritmos de cifrado simétrico para cifrar la comunicación una vez que se establece la conexión.

---

## **5. Puerto TCP estándar para servidores SSH**

El puerto TCP estándar asignado para contactar con los servidores SSH es el **22**.

---

## **6. Protocolos que permiten iniciar sesión en un servidor remoto**

Además de SSH, otros protocolos que permiten iniciar sesión en un servidor remoto incluyen:

- **Telnet**: Protocolo de acceso remoto que no cifra la conexión.
- **RDP (Remote Desktop Protocol)**: Protocolo utilizado principalmente en sistemas Windows para acceso remoto a escritorios.
- **VNC (Virtual Network Computing)**: Protocolo que permite el control remoto de un escritorio gráfico.

---

## **7. Protocolos de transferencia de archivos mediante SSH**

Los protocolos de transferencia de archivos que utilizan SSH son:

- **SCP (Secure Copy Protocol)**: Permite la transferencia de archivos de manera segura entre un host local y un host remoto.
- **SFTP (SSH File Transfer Protocol)**: Protocolo de transferencia de archivos que proporciona una interfaz similar a FTP pero sobre una conexión SSH.

---

## **8. Métodos de autenticación que utiliza SSH**

SSH utiliza varios métodos de autenticación, entre ellos:

- **Autenticación por contraseña**: El usuario proporciona una contraseña para acceder al servidor.
- **Autenticación por clave pública**: El usuario utiliza un par de claves (pública y privada) para autenticarse.
- **Autenticación basada en certificados**: Utiliza certificados digitales para autenticar a los usuarios.

---

## **9. Archivo que se debe modificar para cambiar el puerto por defecto**

El archivo que se debe modificar para cambiar el puerto por defecto de SSH es el **`sshd_config`**, que generalmente se encuentra en `/etc/ssh/sshd_config` en sistemas basados en Unix/Linux.

---

## **10. Parámetro para dar mayor seguridad al servicio**

Para aumentar la seguridad del servicio SSH, se recomienda configurar el parámetro **`PermitRootLogin`** a `no`, lo que impide que el usuario root inicie sesión directamente. También se puede considerar cambiar el puerto por defecto y deshabilitar la autenticación por contrase
