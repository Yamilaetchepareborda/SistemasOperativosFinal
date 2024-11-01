
#!/bin/bash

actualizar_sistema() {
    # Verificamos que el usuario es root, es necesario para actualizar el sistema
    if [ "$UID" -eq 0 ]; then
        echo "Actualizando como root"
        apt update && apt upgrade -y

        # Registramos los cambios en un archivo log con fecha y hora
        fecha_hora=$(date +"%Y-%m-%d_%H:%M:%S")
        echo "Se realizaron actualizaciones del sistema a las $fecha_hora" >> registro.log

    elif groups "$USER" | grep -q "\<sudo\>"; then
        echo "Actualizando como sudo"
        sudo apt update && sudo apt upgrade -y

        # Registramos los cambios en un archivo log con fecha y hora
        fecha_hora=$(date +"%Y-%m-%d_%H:%M:%S")
        echo "Se realizaron actualizaciones del sistema a las $fecha_hora" >> registro.log

    else
        echo "Este script debe ser ejecutado como root o con sudo."
        exit 1
    fi
}

# Llama a la función
actualizar_sistema