# Completely Fair Scheduler (CFS) - Linux

## Introducción
El *Completely Fair Scheduler* (CFS) es el algoritmo de planificación por defecto en linux. Su objetivo principal es asignar tiempo de CPU de manera equitativa entre todos los procesos, asegurando que ninguno sea favorecido injustamente. CFS es un planificador basado en *fairness*, y se diseñó para superar las limitaciones de los anteriores algoritmos de planificación en linux.

## Características principales
1. **Equidad en la asignación de CPU**: CFS asigna el tiempo de CPU basándose en la cantidad de tiempo que cada proceso ha recibido hasta el momento. Intenta minimizar la diferencia en la cantidad de CPU que cada proceso ha usado.
   
2. **Modelo de reloj virtual**: CFS utiliza un reloj virtual que avanza más rápidamente para los procesos que están consumiendo más tiempo de CPU y más lentamente para los que usan menos. Así, si un proceso ha utilizado más tiempo de CPU del que debería, su reloj virtual se incrementa más rápidamente, y CFS lo aplaza para que otros procesos tengan su turno.

3. **Estructura de datos de árbol rojo-negro**: Los procesos en CFS se organizan en un árbol auto-balanceado llamado *árbol rojo-negro*, lo que permite una búsqueda eficiente del siguiente proceso a ejecutar. Este árbol está ordenado por el tiempo de ejecución virtual de cada proceso, permitiendo al CFS seleccionar rápidamente el proceso más adecuado para ejecutar.

4. **Responsividad**: Aunque CFS está diseñado para mantener la equidad a largo plazo, también busca ser lo suficientemente rápido para responder a las necesidades de los procesos interactivos, proporcionando una buena experiencia de usuario.

5. **Se evita el uso de *time-slicing***: En lugar de asignar intervalos de tiempo fijos a cada proceso, CFS intenta hacer que los procesos "corran justo el tiempo que deberían" en función de sus necesidades y la cantidad de procesos activos.

## Funcionamiento
El funcionamiento de CFS se basa en el siguiente mecanismo:
1. **Cálculo del tiempo de ejecución**: Cada proceso tiene un valor llamado *vruntime* (tiempo de ejecución virtual), que refleja cuánto tiempo efectivo ha usado la CPU. Cuanto más tiempo real usa un proceso, mayor es su *vruntime*.
   
2. **Selección del siguiente proceso**: CFS selecciona siempre el proceso con el *vruntime* más bajo del árbol rojo-negro, lo que significa que selecciona al proceso que ha usado menos tiempo de CPU en relación con los demás.

3. **Actualización del reloj virtual**: A medida que un proceso se ejecuta, su *vruntime* aumenta, lo que eventualmente lo desplaza hacia abajo en el árbol, permitiendo que otros procesos tomen el control de la CPU.

4. **Proceso de espera**: Si un proceso está en espera, su *vruntime* no se incrementa, lo que permite que el proceso que estuvo esperando reciba más tiempo de CPU cuando finalmente está listo para ejecutarse.

5. **Procesos de alta prioridad**: CFS también soporta clases de procesos con diferentes niveles de prioridad. Los procesos con mayor prioridad reciben más tiempo de CPU, mientras que los procesos de menor prioridad reciben menos.


