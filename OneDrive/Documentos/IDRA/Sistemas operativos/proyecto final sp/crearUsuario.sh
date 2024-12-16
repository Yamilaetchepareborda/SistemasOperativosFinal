#!/bin/bash

# Función para listar usuarios y los grupos a los que pertenecen
listar_usuarios() {
    echo "Usuarios y sus grupos:"
    # Listamos todos los usuarios y los grupos a los que pertenecen
    while IFS=: read -r usuario _ _ _ _ _; do
        # Muestra los grupos del usuario usando id
        
        groups $usuario 
    done < /etc/passwd
}

# Función para agregar o modificar un usuario
gestionar_usuario() {
    # Pedir el nombre del usuario
    read -p "Ingrese el nombre del usuario: " usuario

    # Verificar si el usuario ya existe
    if id "$usuario" &>/dev/null; then
        echo "El usuario $usuario ya existe."

        # Preguntar si desea modificar el usuario
        read -p "¿Desea modificar este usuario? (s/n): " modificar
        if [[ "$modificar" == "s" || "$modificar" == "S" ]]; then
            # Modificar grupos
            read -p "¿Desea modificar los grupos del usuario? (s/n): " cambiar_grupos
            if [[ "$cambiar_grupos" == "s" || "$cambiar_grupos" == "S" ]]; then
                # Listar grupos disponibles
                echo "Grupos disponibles:"
                cat /etc/group | cut -d: -f1
                read -p "Ingrese los grupos a los que desea añadir el usuario (separados por coma): " grupos
                sudo usermod -aG $grupos $usuario
                echo "El usuario $usuario ha sido añadido a los grupos: $grupos"
            fi

            # Modificar la contraseña
            read -p "¿Desea modificar la contraseña del usuario? (s/n): " cambiar_contrasena
            if [[ "$cambiar_contrasena" == "s" || "$cambiar_contrasena" == "S" ]]; then
                sudo passwd $usuario
                echo "La contraseña del usuario $usuario ha sido cambiada."
            fi
        fi 
        echo "usuario modificado con exito."
    else
        echo "El usuario $usuario no existe."

        # Preguntar si desea agregar al usuario
        read -p "¿Desea agregar este usuario? (s/n): " agregar
        if [[ "$agregar" == "s" || "$agregar" == "S" ]]; then
            # Crear el nuevo usuario
            sudo useradd $usuario
            echo "El usuario $usuario ha sido creado."

            # Modificar grupos
            read -p "¿Desea añadir el usuario a grupos? (s/n): " agregar_grupos
            if [[ "$agregar_grupos" == "s" || "$agregar_grupos" == "S" ]]; then
                # Listar grupos disponibles
                echo "Grupos disponibles:"
                cat /etc/group | cut -d: -f1
                read -p "Ingrese los grupos a los que desea añadir el usuario (separados por coma): " grupos
                sudo usermod -aG $grupos $usuario
                echo "El usuario $usuario ha sido añadido a los grupos: $grupos"
            fi

            # Modificar la contraseña
            read -p "¿Desea establecer una contraseña para el usuario? (s/n): " establecer_contrasena
            if [[ "$establecer_contrasena" == "s" || "$establecer_contrasena" == "S" ]]; then
                sudo passwd $usuario
                echo "La contraseña para el usuario $usuario ha sido establecida."
            fi
                echo "usuario agregado con exito. "
        fi
    fi
}

# Llamada principal
echo "Seleccione una opción:"
echo "1) Gestionar usuario (agregar/modificar)"
echo "2) Listar usuarios y sus grupos"
read opcion

case $opcion in
    1)
        gestionar_usuario
        ;;
    2)
        listar_usuarios
        ;;
    *)
        echo "Opción no válida"
        ;;
esac
