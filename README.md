# Proyecto Serie Fibonacci en Ensamblador :zap:
### Diseño y Estructura de Computadoras :computer:

Este repositorio contiene un ejercicio en lenguaje ensamblador diseñado para generar y mostrar los primeros números de la serie Fibonacci según la cantidad especificada por el usuario del 0 al 9.

## Características :memo:

- Implementación en lenguaje ensamblador para generar la serie Fibonacci.
- Validación de entrada para asegurar que solo se ingresen números válidos.
- Uso de macro o etiquetas para estructurar y organizar el código.

## Estructura del Repositorio :small_red_triangle_down:

El repositorio se organiza en una carpeta dedicada al ejercicio. A continuación, se describe el contenido de la carpeta:

### Proyecto_SerieFibonacci :file_folder:

Contiene los siguientes archivos:

- **Proyecto_SerieFibonacci.asm**: Archivo principal que contiene el código en lenguaje ensamblador para generar la serie Fibonacci.
- **Proyecto_SerieFibonacci.o**: Archivo objeto que contiene el código ensamblador compilado.
- **Proyecto_SerieFibonacci**: Archivo ejecutable que genera y muestra los números de la serie Fibonacci.

## Propósito Detallado :pushpin:

El propósito principal de este proyecto es introducir y practicar los siguientes conceptos:

- Generación de la serie Fibonacci en lenguaje ensamblador.
- Manejo de entrada de usuario y validación para asegurar la correcta operación del programa.
- Uso de estructuras de control y macros para optimizar y estructurar el código.

## Instrucciones de Uso :clipboard:

1. Asegúrese de tener un ensamblador y un linker instalados en su sistema.
2. Clone este repositorio en su sistema local.
3. Abra un terminal y navegue al directorio donde se encuentra el archivo `Proyecto_SerieFibonacci.asm`.
4. En el terminal, ensamble el código utilizando el ensamblador adecuado. Por ejemplo:
   
    ```bash
    nasm -f elf32 Proyecto_SerieFibonacci.asm
    ```
5. Luego, linkee el archivo objeto generado para crear el ejecutable:
   
   ```bash
    ld -o Proyecto_SerieFibonacci Proyecto_SerieFibonacci.o
    ```

6. Ejecute el programa resultante:

    ```bash
    ./Proyecto_SerieFibonacci
    ```
7. Siga las instrucciones en pantalla para ingresar el numero del 0 al 9 y observe el resultado en la consola.

### Notas Adicionales  :newspaper:

- Este ejercicio se ha desarrollado y probado en un entorno Linux utilizando la arquitectura x86. Es posible que se necesiten ajustes para ejecutarlo en otros sistemas operativos o arquitecturas.
- Se recomienda tener un conocimiento básico de lenguaje ensamblador y de programación en general para comprender completamente el código y el proceso de ejecución.
    
