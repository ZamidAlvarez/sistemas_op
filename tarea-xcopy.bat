@echo off

:inicio
echo seleccione una opcion:
echo 1 - crear copia de directorio y sus archivos
echo 2 - eliminar directorio
echo 3 - salir

set /p opcion=

if %opcion%==1 goto :copiar
if %opcion%==2 goto :eliminar
if %opcion%==3 goto :salir

:copiar

set /p origen="ingrese la ruta del directorio a copiar: "
set /p destino="ingrese la ruta donde desea copiar el directorio: "
set /p carpeta="ingrese el nombre de una carpeta donde quiera guardar el directorio: "
xcopy /E /I /Y "%origen%" "%destino%\%date:~5,2%-%date:~8,2%-%date:~11,4%-%time:~0,2%-%time:~3,2%-%time:~6,2%\%carpeta%"
echo el directorio ha sido copiado exitosamente.
goto :inicio

:eliminar
set /p ruta="ingrese la ruta del directorio a eliminar: "
if /I "%ruta%"=="c:\windows\system32" (
    echo no es posible eliminar el directorio system32.
) else (
    rd /S /Q "%ruta%"
    echo el directorio ha sido eliminado exitosamente.
)
goto inicio

:salir
echo adios.
exit