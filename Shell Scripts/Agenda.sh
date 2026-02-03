# Ejercicio entregable
# Autor: Adrian Jimenez Rodriguez
# Fecha: 29/01/2026

clear


Archivo="agenda.txt"

# Crear el archivo si no existe
touch "$Archivo"

opcion=""

while [ "$opcion" != "e" ]
do
    echo "        AGENDA"
    echo "a) Añadir entrada"
    echo "b) Buscar DNI"
    echo "c) Ver agenda completa"
    echo "d) Eliminar todas las entradas"
    echo "e) Finalizar"
    echo -n "Elige una opción: "
    read opcion

    case $opcion in
        a)
            echo -n "Introduce el DNI: "
            read dni

            if grep -q "^$dni:" "$Archivo"; then
                echo "Esta  persona ya está dada de alta, pruebe de nuevo"
            else
                echo -n "Introducir nombre: "
                read nombre
                echo -n "Introducir apellidos: "
                read apellidos
                echo -n "Introducir localidad: "
                read localidad

                echo "$dni:$nombre:$apellidos:$localidad" >> "$Archivo"
                echo
                echo "Entrada añadida."
            fi
            ;;
        b)
            echo -n "Introduce el DNI a buscar: "
            read dni

            linea=$(grep "^$dni:" "$Archivo")

            if [ -z "$linea" ]; then
                echo "Error: DNI no encontrado."
            else
                nombre=$(echo "$linea" | cut -d: -f2)
                apellidos=$(echo "$linea" | cut -d: -f3)
                localidad=$(echo "$linea" | cut -d: -f4)
                echo
                echo "La persona con DNI: $dni es: $nombre $apellidos, y reside en $localidad"
            fi
            ;;
        c)
            if [ ! -s "$Archivo" ]; then
                echo
                echo "La agenda está vacía"
            else
                echo
                echo "Contenido de la agenda:"
                echo
                cat "$Archivo"
            fi
            ;;
        d)
            > "$Archivo"
            echo
            echo "Eliminando entradas..."
            echo "Todas las entradas fueron eliminadas."
            ;;
        e)
            echo
            echo "Saliendo del programa..."
            echo "Programa cerrado"
            ;;
        *)
            echo
            echo "Opción no invalida."
            ;;
    esac

    echo

done
