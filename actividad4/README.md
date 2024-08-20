# Servicio de Saludo Infinito

Este servicio de `systemd` ejecuta un script que imprime un saludo y la fecha actual infinitamente con una pausa de un segundo.  
Para la creación del script usaremos el siguiente código y nombre: saludo.sh.
```bash
   #!/bin/bash

   while true; do
       echo "¡Hola! La fecha actual es: $(date)"
       sleep 1
   done
```
## Instalación
1. **Permisos**
```bash
sudo chmod +x saludos.sh
```
2. **Instalación**
Movemos los archivos a las carpetas necesarias
```bash
sudo cp saludo.sh /usr/local/bin/
sudo cp saludo.service /etc/systemd/system/saludo.service
```
Iniciamos los procesos
```bash
`sudo systemctl enable saludo.service`
`sudo systemctl start saludo.service`
```
Para poder ver los logs del servicio
```bash
sudo journalctl -u saludo.service
```
para detener el servicio
```bash
`sudo systemctl stop saludo.service`
```
