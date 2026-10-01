# Data Lab Peru - Control de Hardware v4.0 🐧⚡

Script avanzado de automatización desarrollado en **PowerShell** enfocado en el diagnóstico, control de calidad y validación integral de componentes críticos de hardware. Esta herramienta CLI fue diseñada para ejecutarse de manera obligatoria en dos fases críticas: **Pre-mantenimiento** (auditoría inicial de componentes antes de la apertura física de la máquina) y **Post-mantenimiento** (control de calidad final antes de la entrega al cliente).

## 📌 Módulos de Validación del Sistema

* 🖥️ **Fase de Inicialización:** Extracción automática de metadatos del Sistema Operativo, identificación del fabricante del equipo (ASUS, HP, etc.), especificaciones del Procesador Central e inventario de Memoria RAM Total y Controladores de Video (NVIDIA, etc.).
* 🌐 **[PASO 1] Conectividad de Red:** Escaneo y diagnóstico del adaptador de red inalámbrica, validación de tráfico HTTP y detección de redes limitadas.
* ⌨️ **[PASO 2] Integración de Interfaces:** Mapeo y testeo en tiempo real de buses físicos del teclado, touchpads integrados y dispositivos apuntadores USB.
* 📡 **[PASO 3] Buses de Comunicación:** Diagnóstico de antenas Bluetooth, estado de los servicios del sistema y análisis de controladoras USB en placa para detectar líneas sin energía.
* ⚡ **[PASO 4] Arquitectura Eléctrica & Multimedia:** Pruebas acústicas en altavoces, captura de micrófonos en Kernel, estado del bus de la cámara web y extracción del flujo de energía de la placa (tipo de alimentación y estabilidad de la fuente).

## 🏗️ Estructura Visual de la Consola

El software implementa una arquitectura defensiva y legible en terminal mediante códigos de estado estandarizados:
* `[+]` -> Inicialización de hardware/Lectura exitosa de metadatos.
* `[ OK ]` -> Componente operativo, bus respondiendo y mapeado con éxito.
* `[ ADVERTENCIA ]` -> Dispositivo detectado con tráfico restringido o conectividad limitada.
* `[ FALLO ]` -> Lente/Flex físico desconectado, o servicio deshabilitado en el sistema a nivel de Kernel.

## 🛠️ Tecnologías Utilizadas

* **Lenguaje:** PowerShell Scripting ⚡
* **Entorno:** Windows Terminal / PowerShell Core 🖥️
* **Enfoque:** Automatización de Infraestructura & Control de Calidad TI (QA)
