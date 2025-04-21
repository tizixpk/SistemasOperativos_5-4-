# Preguntas y Respuestas sobre Configuración de SSH

## Pregunta 1: ¿Qué es el protocolo SSH?
El protocolo SSH (Secure Shell) permite: **conectarnos a equipos remotos así mismo, nos da la capacidad de llevar a cabo tareas administrativas dentro del mismo como activar o apagar servicios** . Además de la conexión a otros equipos, SSH nos permite copiar datos de forma segura, gestionar claves RSA para no escribir claves al conectar a las máquinas y pasar los datos de cualquier otra aplicación por un canal seguro tunelizado mediante SSH.

## Pregunta 2: ¿Cuáles son los requerimientos para la instalación de OpenSSH?
Los paquetes a descargar son los siguientes:
- OpenSSH
- OpenSSH-clients
- OpenSSH-server  
La forma en que se instalarán estos paquetes será tecleando en consola lo siguiente:  
```bash
# aptitude install openssh openssh-clients openssh-server
```

## Pregunta 3: ¿Dónde se encuentran los archivos de configuración de OpenSSH?
Los archivos referentes al servidor se encuentran en la ruta:  
`/etc/ssh/`  
Los archivos de configuración del lado del cliente se encuentran almacenados en el directorio de trabajo de cada usuario, en la carpeta `.ssh`, por ejemplo:  
`/home/usuario/.ssh`

## Pregunta 4: ¿Qué configuraciones de seguridad se pueden aplicar en el archivo `sshd_config`?
Algunas configuraciones de seguridad que se pueden aplicar son:
- Cambiar el puerto por defecto.
- Desactivar el Protocolo 1.
- Deshabilitar el acceso a root.
- Definir un número máximo de intentos de conexión.
- Activar el modo estricto.
- Limitar el tiempo para autenticarse con SSH.

## Pregunta 5: ¿Cómo se inicia el servicio SSH?
Para iniciar el servicio de SSH, se debe ejecutar uno de los siguientes comandos como root:  
```bash
# /etc/init.d/sshd start
```
o  
```bash
# systemctl start sshd
```

## Pregunta 6: ¿Qué es el fingerprint SSH?
El fingerprint SSH es una huella asociada a la clave pública del servidor. La idea de SSH es que nadie nos engañe al momento de conectarnos a un servidor, entonces la advertencia que nos muestra es que es la primera vez que nos conectamos a ese servidor y que el fingerprint o huella es la siguiente.

## Pregunta 7: ¿Qué es OpenSSH?
OpenSSH (Open Secure Shell) es un conjunto de aplicaciones que permiten realizar comunicaciones cifradas a través de una red, usando como base al protocolo SSH. Este proyecto es liderado actualmente por Theo de Raadt y se considera más seguro que el original debido a la reputación de los desarrolladores de OpenBSD por crear código limpio y perfectamente auditado.

## Pregunta 8: ¿Qué herramientas proporciona OpenSSH para la transferencia de archivos?
OpenSSH proporciona dos herramientas para la transferencia de archivos:
- SCP (Secure Copy Protocol)
- SFTP (Secure File Transfer Protocol)  
Estas herramientas tienen la misma función de copiado, solo se diferencian en la forma en que son aplicadas.

## Pregunta 9: ¿Qué se debe hacer si se quiere deshabilitar el acceso a root?
Para deshabilitar el logeo al sistema a través de la cuenta de root, se debe poner en “no” la variable `PermitRootLogin` en el archivo de configuración `sshd_config`.

## Pregunta 10: ¿Cómo se limita el tiempo para autenticarse con SSH?
Para limitar el tiempo para autenticarse con SSH, se debe editar el parámetro `LoginGraceTime` en el archivo de configuración `sshd_config`, estableciendo el número de segundos que la pantalla de login estará disponible.

## Pregunta 11: ¿Qué se debe hacer si el fingerprint del servidor cambia?
Si el fingerprint cambia, el cliente SSH denegará el acceso. En este caso, se debe ingresar a la línea `known_hosts` que se indica y eliminar esa línea, o ejecutar el comando:  
```bash
ssh-keygen -R hostname
```

---

**Autores:** Pirez Tiziano y Elias Rod.
```
