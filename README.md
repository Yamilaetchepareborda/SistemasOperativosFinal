PROYECTO DE SISTEMAS OPERATIVOS

Descripción
Este proyecto es una colección de scripts Bash diseñados para administrar tareas comunes del sistema en Linux, como la gestión de usuarios, la verificación de actualizaciones y la creación de informes de uso del sistema. La herramienta se ejecuta a través de un menú interactivo, lo que facilita la navegación entre las distintas funciones.

Funcionalidades
El menú interactivo permite realizar las siguientes tareas:

Crear un nuevo usuario: Permite agregar un nuevo usuario al sistema o modificar uno existente.
Verificar e instalar actualizaciones: Comprueba si hay actualizaciones disponibles para el sistema e inicia el proceso de instalación.
Mostrar el uso de memoria y crear un reporte: Muestra el uso de la memoria, CPU y disco, y guarda esta información en un archivo reporte.log.
Salir: Cierra el menú.
Estructura de Archivos
menu.sh: Script principal que presenta el menú interactivo.
crearUsuario.sh: Script encargado de verificar, agregar o modificar usuarios en el sistema.
actualizar.sh: Script que verifica e instala actualizaciones del sistema.
reporte.sh: Muestra el uso de memoria, CPU y disco, y genera un archivo reporte.log con la información recopilada.
reporte.log: Archivo de log que contiene el informe generado sobre el uso del sistema.
Requisitos
Sistema operativo Linux (o WSL si estás en Windows).
Permisos de superusuario (sudo) para ejecutar funciones que requieren permisos elevados, como la creación de usuarios y la instalación de actualizaciones.
Instrucciones de Uso
Clonar el repositorio (opcional si ya se encuentra en el sistema):

bash
Copiar código
git clone <URL-del-repositorio>
cd <nombre-del-repositorio>
Asegurar permisos de ejecución para todos los scripts:

bash
Copiar código
chmod +x menu.sh crearUsuario.sh actualizar.sh reporte.sh
Ejecutar el menú interactivo:

bash
Copiar código
sudo ./menu.sh
Navegar por las opciones: Sigue las instrucciones del menú para crear usuarios, verificar actualizaciones o ver el uso del sistema.

Ejemplo de Uso
Al ejecutar ./menu.sh, verás el siguiente menú:

diff
Copiar código
=== MENÚ INTERACTIVO ===
1) Crear un nuevo usuario
2) Verificar e instalar actualizaciones
3) Mostrar el uso de memoria y crear un reporte
4) Salir
Selecciona una opción:
Opción 1: Ejecuta crearUsuario.sh para agregar o modificar un usuario.
Opción 2: Ejecuta actualizar.sh para comprobar e instalar actualizaciones.
Opción 3: Ejecuta reporte.sh para ver el uso actual de memoria, CPU y disco, y genera un archivo reporte.log con esta información.
Opción 4: Cierra el menú interactivo.
Notas
Es recomendable ejecutar menu.sh con permisos sudo para que las operaciones que requieren permisos elevados puedan funcionar correctamente.
Asegúrate de que todos los scripts se encuentren en el mismo directorio que menu.sh para su correcto funcionamiento.
Contribuciones
Las contribuciones son bienvenidas. Puedes hacer un fork del repositorio, realizar tus cambios y enviar un pull request para revisión.

Licencia
Este proyecto se encuentra bajo una licencia de libre uso para fines académicos y de aprendizaje.
