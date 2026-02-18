#!/bin/bash
# Script Segundo entreganle Calculadora.sh
# Autor: Adrián Jiménez Rodríguez
# Fecha: 17-02-2026

clear

fichero=$1
operaciones=$2


if [ $# -ne 2 ]; then

	echo "Error, número de parámetros es incorrecto, intente de nuevo mas tarde"
	exit
fi

if [ -f $1 ]; then

	echo "El fichero ya existe"
	exit
fi

read -p "Operación Op1 Op2" Op op1 op2

num=0

while [$num -lt $2 ]; do

	echo "------------------"
	echo "S para sumar"
	echo "R para una resta"
	echo "M para multiplicación"
	echo "D para división"
	echo "X para salir"
	echo "------------------"

	case $Op in

		"S")

			resul=$((op1+op2))
		;;

		"R")

			resul=$((op1-op2)
		;;

		"M")

			resul=$((op1*op2))
		;;

		"D")

			resul=$((op1/op2))
		;;

		"X")
			echo "Saliendo"
			break
		;;

		*)

			echo "Error opción no válida"
		;;

	esac

		echo "El resultado es: $resul"
		echo "$Op $op1 $op2" >> $1

done

echo "Ruta del fichero: $(pwd)/$1*"
cat $1
