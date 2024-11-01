#!/bin/bash

# Colores para mejorar la experiencia del usuario
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'  # Sin color

while true; do
    echo -e "${CYAN}=== MENÚ INTERACTIVO ===${NC}"
    echo -e "${YELLOW}1) Crear un nuevo usuario${NC}"
    echo -e "${YELLOW}2) Verificar e instalar actualizaciones${NC}"
    echo -e "${YELLOW}3) Mostrar el uso de memoria y crear un reporte${NC}"
    echo -e "${YELLOW}4) Salir${NC}"

    read -p "Selecciona una opción: " opcion

    case $opcion in
        1) ./ingresarUsuario.sh ;;  # Ejecuta el script para crear un usuario
        2) ./verifActualiz.sh ;;  # Ejecuta el script de actualización
        3) ./mostrarUso.sh ;;  # Mostrar informacion del uso del equipo y generar informe
        4) echo "Saliendo..."; exit 0 ;;
        *) echo -e "${RED}Opción inválida. Intenta de nuevo.${NC}" ;;
    esac
done