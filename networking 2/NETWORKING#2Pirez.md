### Pirez Tiziano 5to 4ta
# NETWORKING - Conversión a Markdown

NETWORKING

---

PARTE#01

Establecer y relevar las direcciones IPv4 y documentarlas en el plano

Tarea realizada en la parte 1

<img width="729" height="333" alt="image" src="https://github.com/user-attachments/assets/92a9004a-ccd8-45a8-98d7-39cc81ff8765" />

---

Desde PC Windows – Física

(CONFIGURACION)

Puerta de enlace predeterminada:

<img width="612" height="293" alt="image" src="https://github.com/user-attachments/assets/37a02e39-e595-4a01-aa87-ff15fae0535e" />

---

Añadir otra puerta de enlace/ruta:

<img width="363" height="117" alt="image" src="https://github.com/user-attachments/assets/aae95286-2834-4eff-8764-f733da3b368b" />

<img width="641" height="44" alt="image" src="https://github.com/user-attachments/assets/f399da41-5533-4449-ab48-c6af007bdffe" />

---

VERIFICACION CON “route print”

<img width="606" height="58" alt="image" src="https://github.com/user-attachments/assets/15b70254-06c4-4d11-abfc-eea095d34bd1" />

---

ping al GW - Mikrotik

<img width="503" height="217" alt="image" src="https://github.com/user-attachments/assets/ab01bdeb-fa07-4753-b104-bcfa542f0576" />


---

Ingresar al router Mikrotik y establecer IP estática en ether1

<img width="617" height="235" alt="image" src="https://github.com/user-attachments/assets/3ac19f64-7a9a-45ce-81ee-860e9c80c52e" />

---

Desde la red LAN virtual (cliente Ubuntu server), probar conectividad


Desde PC Windows

ping al GW


<img width="488" height="143" alt="image" src="https://github.com/user-attachments/assets/8ce55c5b-4b78-4591-ab8d-c1847b3b478c" />

---

Desde Servidor Ubuntu 
   
ping al GW

<img width="527" height="134" alt="image" src="https://github.com/user-attachments/assets/d4652561-df51-4d6e-9459-19e05102fd68" />

---

Desde Router Mikrotik (no funciona) no funciona con Google, pero si con 8.8.8.8  ping a Google.com

<img width="602" height="191" alt="image" src="https://github.com/user-attachments/assets/2ba06a64-cda7-41ca-b4c7-f107b4626c8e" />


---

PARTE #2

Aplicar regla de NAT para tener acceso a internet

#### /ip firewall nat add chain=srcnat out-interface=ether1 action=masquerade chain=srcnat 
###### se aplica a tráfico saliente.
#### out-interface=ether1 
###### define la interfaz que sale a Internet.
#### action=masquerade 
##### oculta las IP privadas detrás de la IP pública del router. ´´´

<img width="637" height="33" alt="image" src="https://github.com/user-attachments/assets/ad8332e5-684c-44bb-a9ef-e1f0dd167481" />

---

Resuelto también en parte grafica

Desde PC Windows (Ubuntu server-cliente)

ping a Google.com no funciona con Google, pero si con 8.8.8.8


<img width="532" height="207" alt="image" src="https://github.com/user-attachments/assets/426d081d-68a8-40ed-9352-54a7084a9d1b" />

---

Desde Servidor Ubuntu 
 ping a Google.com
 no funciona con Google, pero si con 8.8.8.8

<img width="560" height="159" alt="image" src="https://github.com/user-attachments/assets/145648c8-e6d6-4145-b609-ae5b17468df5" />

---

Establecer una ruta estática en la PC física para tener acceso a la red LAN virtual

Verificar conectividad usando el comando ping desde la PC física a cualquier dispositivo final de la LAN virtual

#### route add 192.168.3.0 mask 255.255.255.0 192.168.1.254 -p
###### 192.168.3.0 red LAN virtual
###### 255.255.255.0 máscara de la red LAN
##### 192.168.1.254 dirección del router (gateway) IMPORTANTE Esta direccion es la de tu red. No NECESARIAMENTE ES LA MISMA
##### -p → hace que la ruta sea persistente después de reiniciar (OPCIONAL)

En Linux

### sudo ip route add 192.168.10.0/24 via 192.168.1.254

Windows (PC Física):

<img width="648" height="44" alt="image" src="https://github.com/user-attachments/assets/d620d831-c4c4-44ca-beaa-5189c4027b0c" />

---


<img width="639" height="79" alt="image" src="https://github.com/user-attachments/assets/9b5d8461-bab2-4bbb-b47f-9f894134bb62" />

---

Linux (Ubuntu Server):



<img width="584" height="28" alt="image" src="https://github.com/user-attachments/assets/d99e379d-80e9-4991-8e41-f621b6f33f5d" />

