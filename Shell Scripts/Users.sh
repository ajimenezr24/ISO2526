#!/bin/bash
# Script: Entregable 4, Users.sh
# Autor: Adrián Jiménez Rodríguez
# Fecha: 18-02-2026

clear

if [ $USER != "root" ]; then

	echo "Error, no eres root"
	exit
fi

if [ -z $1 ]; then

	base=1000
else

	base=$1
fi

fecha=$(date +%d-%m-%Y)
hora=$(date +%H:%M)

echo "---------------------"

echo "Informe de usuarios el día $fecha a las $hora"

contador=0

while  IFS=: read usuario x uid resto; do

	if [ $uid -gt $base ]; then

		echo "$usuario - $uid"
		contador=$((contador+1))
	fi

done < /etc/passwd

echo "Total de usuarios: $contador"

echo "----------------------------"
echo "$fecha - $hora - El usuario $USER ha solicitado un informe de usuarios" >> /tmp/logeventos
