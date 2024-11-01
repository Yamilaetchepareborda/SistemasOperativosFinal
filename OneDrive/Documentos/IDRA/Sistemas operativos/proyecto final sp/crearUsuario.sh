#!/bin/bash

echo "Ingrese el nombre del nuevo usuario: "
read usuario

# Verificar si el usuario ya existe
if id "$usuario" &>/dev/null; then
    echo "El usuario '$usuario' ya existe."
    echo "¿Deseas modificarlo? (s/n)"
    read respuesta

    if [[ "$respuesta" == "s" || "$respuesta" == "S" ]]; then
        echo "Modificando el usuario '$usuario'."
        # Cambiar la contraseña del usuario
        sudo passwd "$usuario"
        echo "Contraseña de '$usuario' modificada con éxito."
    else
        echo "No se realizaron cambios."
    fi
else
    # Crear el nuevo usuario
    sudo adduser "$usuario"
    echo "Usuario '$usuario' creado con éxito."
    fi