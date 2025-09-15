# NETWORKING - Conversión a Markdown

Este archivo fue generado a partir de `NETWORKING#2Pirez.docx` y las imágenes se colocaron en la carpeta `NETWORKING#2Pirez_images`.

NETWORKING

PARTE#01

Establecer y relevar las direcciones IPv4 y documentarlas en el plano

Tarea realizada en la parte 1
![image_1.png](./NETWORKING#2Pirez_images/image_1.png)

Desde PC Windows – Física

(CONFIGURACION)

Puerta de enlace predeterminada:

![image_2.png](./NETWORKING#2Pirez_images/image_2.png)

Añadir otra puerta de enlace/ruta:

![image_3.png](./NETWORKING#2Pirez_images/image_3.png)

![image_4.png](./NETWORKING#2Pirez_images/image_4.png)

VERIFICACION CON “route print”

![image_5.png](./NETWORKING#2Pirez_images/image_5.png)

ping al GW - Mikrotik

![image_6.png](./NETWORKING#2Pirez_images/image_6.png)

Ingresar al router Mikrotik y establecer IP estática en ether1
![image_7.png](./NETWORKING#2Pirez_images/image_7.png)

Desde la red LAN virtual (cliente Ubuntu server), probar conectividad
 Desde PC Windows

ping al GW

![image_8.png](./NETWORKING#2Pirez_images/image_8.png)

Desde Servidor Ubuntu 
                             ping al GW
![image_9.png](./NETWORKING#2Pirez_images/image_9.png)

Desde Router Mikrotik (no funciona) no funciona con Google, pero si con 8.8.8.8
                       ping a Google.com
![image_10.png](./NETWORKING#2Pirez_images/image_10.png)

PARTE #2

Aplicar regla de NAT para tener acceso a internet

/ip firewall nat add chain=srcnat out-interface=ether1 action=masquerade

chain=srcnat se aplica a tráfico saliente.

out-interface=ether1 define la interfaz que sale a Internet.

action=masquerade oculta las IP privadas detrás de la IP pública del router.

![image_11.png](./NETWORKING#2Pirez_images/image_11.png)

Resuelto también en parte grafica

Desde PC Windows (Ubuntu server-cliente)

ping a Google.com no funciona con Google, pero si con 8.8.8.8
![image_12.png](./NETWORKING#2Pirez_images/image_12.png)

Desde Servidor Ubuntu 
 ping a Google.com
 no funciona con Google, pero si con 8.8.8.8

![image_13.png](./NETWORKING#2Pirez_images/image_13.png)

Establecer una ruta estática en la PC física para tener acceso a la red LAN virtual

Verificar conectividad usando el comando ping desde la PC física a cualquier dispositivo final de la LAN virtual

route add 192.168.3.0 mask 255.255.255.0 192.168.1.254 -p

192.168.3.0 red LAN virtual

255.255.255.0 máscara de la red LAN

192.168.1.254 dirección del router (gateway) IMPORTANTE Esta direccion es la de tu red. No NECESARIAMENTE ES LA MISMA

-p → hace que la ruta sea persistente después de reiniciar (OPCIONAL)

En Linux

sudo ip route add 192.168.10.0/24 via 192.168.1.254

Windows (PC Física):

![image_4.png](./NETWORKING#2Pirez_images/image_4.png)

![image_14.png](./NETWORKING#2Pirez_images/image_14.png)

Linux (Ubuntu Server):

![image_15.png](./NETWORKING#2Pirez_images/image_15.png)

