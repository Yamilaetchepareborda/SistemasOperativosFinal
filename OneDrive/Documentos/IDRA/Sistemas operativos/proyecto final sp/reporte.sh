#!/bin/bash

echo "-------INFORMACION-------"
echo "-------------------------"
echo "Fecha y hora"
echo "$(date '+%F %T')"
echo "-------------------------"
echo "Uso de memoria:"
free -h
echo "-------------------------"
echo "Uso de CPU"
top -bn1 | grep "Cpu(s)"
echo "-------------------------"
echo "Uso de disco"
df -h
echo "-------------------------"
echo "Creando reporte..."

# Guardar el informe en un archivo
{
    echo "-------INFORMACION-------"
    echo "Fecha y hora: $(date '+%F %T')"
echo "-------------------------"
    echo "Uso de memoria:"
    free -h
echo "-------------------------"
    echo "Uso de CPU:"
    top -bn1 | grep "Cpu(s)"
echo "-------------------------"
    echo "Uso de disco:"
    df -h
} > reporte.log

echo "Reporte creado en reporte.log"