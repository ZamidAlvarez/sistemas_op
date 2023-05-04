@echo off

:inicio
echo seleccione una opcion:
echo 1. buscar y borrar.
echo 2. salir.

set /p opcion=
if %opcion%==1 goto :buscar
if %opcion%==2 goto :salir

:buscar
echo.
set /p directorio=ingrese la ruta del directorio a buscar:
set /p dias=ingrese el numero de dias para buscar el directorio a eliminar:
echo Buscando directorios en %directorio%
tree /f %directorio%
forfiles /p %directorio% /d -%dias% /c "cmd /c if @isdir==TRUE rd /s /q @path"
echo. 
tree /f %directorio%
echo.
goto :inicio

:salir
echo programa finalizado.
exit