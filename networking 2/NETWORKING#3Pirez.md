# Reenvío puertos en MikroTik

**Tiziano Pirez — 5to 4ta**

---

## Introducción

Acceder a los equipos de nuestra casa desde Internet es posible. Tradicionalmente a esto se le llama *"abrir puertos en el router"* y significa poner a disposición de "cualquiera" en Internet uno o varios puertos y direcciones IPs de la red interna (LAN). La red LAN normalmente no está accesible desde equipos externos; cuando sea necesario se debe configurar el router para permitir dicho acceso.

---

## ¿Qué significa abrir puertos?

Acceder desde Internet a un equipo de una red LAN no es posible por defecto ya que el router bloquea esas conexiones entrantes. Si queremos —por ejemplo— instalar un servidor Web, FTP, NAS, etc. en un equipo dentro de la LAN, hay que abrir (redirigir) los puertos en el router hacia la IP y puerto del equipo objetivo. Esta configuración es la que coloquialmente llamamos **"abrir puertos en el router"**.

---

## 1. Elementos necesarios para este laboratorio

* MikroTik o equipo con RouterOS conectado a Internet
* Laboratorio Networking 1 y 2 (pre-requisitos)

---

## 2. Esquema de red

Aquí van los diagramas / imágenes del esquema de red incluidos en el documento original.

<img width="663" height="331" alt="image" src="https://github.com/user-attachments/assets/acf23501-4b46-4b92-9aa8-66f190f024aa" />


---

## 3. Abrir puerto en el MikroTik

En este laboratorio vamos a abrir el puerto **9000/tcp** en el MikroTik; las peticiones que lleguen desde la WAN (internet) al puerto 9000 serán redirigidas al equipo **10.10.10.3** al puerto **80/tcp** (servidor web Apache).

A continuación se muestran las IPs configuradas en el MikroTik en sus dos interfaces 

### Crear la regla de NAT

Usar el siguiente comando en la terminal del RouterOS:

```bash
/ip firewall nat add chain=dstnat protocol=tcp dst-port=9000 in-interface=WAN action=dst-nat to-addresses=10.10.10.3 to-ports=80
```

*(Captura del ejemplo en la GUI / terminal)*

<img width="603" height="35" alt="image" src="https://github.com/user-attachments/assets/0a642ce0-5636-4f5e-8847-e957f063bedf" />


---

## 4. Probar el puerto abierto

1. Desde una conexión externa (no desde la misma LAN), apuntar el navegador a `http://<IP pública>:9000` o usar `curl`:

```bash
curl http://<IP_pública>:9000
```

2. Si la redirección funciona correctamente verás la respuesta del servidor Apache (puerto 80 del host 10.10.10.3).

<img width="592" height="304" alt="image" src="https://github.com/user-attachments/assets/9812ee61-fac9-4fe8-b69c-9805a3bc637a" />

<img width="662" height="216" alt="image" src="https://github.com/user-attachments/assets/1f844cf7-dbf5-41f0-bd0d-112e8c98f628" />

---

## Notas finales

* El trabajo fue realizado en casa ya que en clase no se puede trabajar con el Wifi nefasto y sin explicaciones. Tuve ayuda de la ia para corregir errores
---

