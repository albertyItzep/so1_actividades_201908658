# Tipos de Kernel

El kernel es el núcleo del sistema operativo que gestiona el hardware y las operaciones básicas del sistema. Los principales tipos de kernel son los siguientes:

1. **Monolítico:**
   En este kernel, todo el código del sistema operativo se ejecuta en el mismo espacio de memoria.
   - **Ventajas:**
     - Nos brinda alta eficiencia debido a la baja sobrecarga de llamadas entre módulos.
     - Acceso directo a los recursos de hardware.
   - **Desventajas:**
     - Los errores en el kernel son difíciles de aislar por la falta de modularidad.
     - Puede ser más complicado de mantener y extender.

2. **Microkernel:**
   En este, solo las funciones más esenciales se ejecutan en modo núcleo. Los servicios adicionales se ejecutan en el espacio de usuario como procesos independientes.
   - **Ventajas:**
     - Mayor modularidad y facilidad de mantenimiento.
     - Mayor estabilidad, ya que los fallos en los servicios no afectan al núcleo.
   - **Desventajas:**
     - Potencialmente mayor sobrecarga debido a la comunicación entre procesos.
     - Menor rendimiento comparado con los kernels monolíticos en algunos casos.

3. **Kernel Híbrido:**
   Combinan las características de los kernels monolíticos y microkernel.
   - **Ventajas:**
     - Intentan equilibrar la eficiencia y la modularidad.
   - **Desventajas:**
     - La complejidad en el diseño puede llevar a problemas en la implementación.

# User vs Kernel Mode

1. **User Mode:**
   Es el nivel en el que se ejecutan las aplicaciones y programas de los usuarios. El modo usuario es un nivel de privilegio más bajo en comparación con el modo núcleo y está diseñado para proporcionar un entorno seguro en el que las aplicaciones puedan operar sin afectar al sistema operativo o al hardware directamente.
   - **Características:**
     - No posee acceso al hardware o a la memoria del sistema; si requieren acceso, deben hacerlo mediante system calls, que son gestionadas por el kernel.
     - Las aplicaciones del usuario están aisladas unas de otras y del mismo núcleo del sistema.
     - Protege la memoria para que las aplicaciones no interfieran con la memoria necesaria para el núcleo.

2. **Kernel Mode:**
   Es el nivel más alto de privilegios en el sistema. En modo núcleo, el código tiene acceso completo a la memoria del sistema y a todos los recursos del hardware. El modo núcleo es donde se ejecuta el núcleo del sistema operativo y los controladores de hardware.
   - **Características:**
     - Este modo tiene acceso completo a todas las capacidades de hardware.
     - Tiene todos los permisos para realizar operaciones, pero deben hacerse con sumo cuidado para no afectar la estabilidad del sistema.

# Interrupciones vs Traps

1. **Interrupciones:**
   Las interrupciones son señales enviadas al procesador por el hardware o por otros eventos externos para indicar que un evento necesita atención inmediata. Las interrupciones permiten que el sistema operativo responda a eventos asíncronos, como la llegada de datos desde un dispositivo de entrada/salida o la expiración de un temporizador.
   - **Características:**
     - Generalmente provienen de dispositivos de hardware, como discos duros, teclados, ratones o temporizadores.
     - No están relacionadas con el flujo normal de ejecución.
     - Al ocurrir este evento, el procesador guarda el estado del proceso actual y transfiere el control a una rutina de manejo de interrupciones. Después de que se maneja la interrupción, el sistema puede restaurar el estado del proceso y reanudar su ejecución.

2. **Traps:**
   Son señales generadas por el propio software para indicar que se ha producido una condición especial o un evento que necesita la atención del sistema operativo. Las trampas suelen ser causadas por errores en el software o por solicitudes explícitas del proceso en ejecución para realizar operaciones específicas.
   - **Características:**
     - Son generadas por el propio proceso en ejecución o por el sistema operativo.
     - Las trampas están sincronizadas con el flujo de ejecución del programa. Se producen como resultado de una instrucción o condición específica en el código.
     - Cuando se produce una trampa, el procesador transfiere el control a una rutina de manejo de trampas en el modo núcleo. El manejo puede involucrar la corrección de errores, la ejecución de servicios del sistema o la terminación del proceso que causó la trampa.


