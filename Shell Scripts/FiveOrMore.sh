#!/bin/bash
# Script: Entregable 3, FiveOrMore
# Autor: Adrián Jiménez Rodríguez
# Fecha: 17-02-2026

clear

if [ $# -ne 2 ]; then

	echo "Error, parametros erroneos"
	exit
fi

salida=$1
directorio=$2

if [ -e $salida ]; then

	echo "Error, el fichero introducido ya existe, intente de nuevo mas tarde"
	exit
fi

if [ ! -d $directorio ]; then

	echo "Error, el directorio introducido no existe, intente de nuevo mas tarde"
	exit
fi

if [ -z $(ls $directorio) ]; then

	echo "Error, el directorio está vacío"
	exit
fi

touch $salida

contador=0

for i in $directorio/*.txt; do

	if [ -f $i ]; then

		lineas=$(wc -l < $i)

		if [ $lineas -ge 5 ]; then

			echo $i
			echo $i >> $salida

			contador=$((contador+1))

			contador_palabras=$(wc -w < $1)

			{
				echo "El fichero original tiene $palabras palabras > $i
				cat $1 
			} > $1.q
		fi
	fi

done

echo "El numero de ficheros identificados son: $contador >> $salida
