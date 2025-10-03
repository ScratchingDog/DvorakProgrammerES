# Dvorak Programmer ES ISO

[Go to English](#english) | [Ir a Español](#español)

---

## English

### 📋 Description

**Dvorak Programmer ES ISO** is a custom keyboard layout that combines the ergonomic benefits of the Programmer Dvorak layout with full support for Spanish language characters. This layout is specially designed for developers and programmers who write code in English while also needing to type in Spanish.

### ✨ Key Features

-   🎯 **Programmer Dvorak base layout** - Numbers require Shift (symbols accessible without Shift for faster coding)
-   🇪🇸 **Full Spanish support** - Includes ñ, á, é, í, ó, ú, and other Spanish characters
-   ⌨️ **ISO keyboard compatible** - Designed for the European/Spanish physical keyboard layout
-   💻 **Multi-platform** - Available for both Linux and Windows
-   🔧 **Ergonomic** - Optimized for reduced finger movement and improved typing comfort
-   🚀 **Programming-focused** - Common programming symbols in easily accessible positions

### 🎯 Who is this for?

This layout is perfect for:

-   Spanish-speaking developers and programmers
-   Anyone who codes primarily in English but also writes in Spanish
-   Users looking for a more ergonomic alternative to QWERTY
-   Dvorak enthusiasts who need Spanish character support

### 📦 Installation

Choose your operating system below for detailed installation instructions:

#### 🐧 Linux Installation

For Linux users (X11/XKB systems), please refer to the comprehensive guide:

👉 **[Linux Installation Guide](Linux/README.md)**

The Linux version includes:

-   Automated installation script with interactive menu
-   Support for multiple layouts in a modular system
-   Automatic backup and restoration of system files
-   Clean uninstallation process

#### 🪟 Windows Installation

For Windows users, please refer to the Windows-specific guide:

👉 **[Windows Installation Guide](Windows/README.md)**

The Windows version includes:

-   Pre-built installer (DLL files included in `dist.zip`)
-   Editable `.klc` file for Microsoft Keyboard Layout Creator 1.4
-   Step-by-step installation instructions

### 🗂️ Project Structure

```
dvp-es/
├── README.md                          # This file (project overview)
├── Linux/                             # Linux installation files
│   ├── README.md                      # Linux installation guide
│   ├── install.sh                     # Automated installation script
│   └── layouts/                       # Layout definitions
│       └── dvp_es_iso/
│           ├── dvp_es_iso.xkb        # XKB symbols definition
│           ├── dvp_es_iso.xml        # XKB metadata
│           └── dvp_es_iso.lst        # XKB listing entries
└── Windows/                           # Windows installation files
    ├── README.md                      # Windows installation guide
    ├── spanish-programmer-dvorak.klc  # Keyboard Layout Creator source
    ├── dist.zip                       # Pre-built installer (DLLs)
    └── images/                        # Layout reference images
        ├── prgdvkes.jpg
        ├── prgdvkesShft.jpg
        ├── prgdvkesAltGr.jpg
        ├── prgdvkesCaps.jpg
        └── prgdvkesShftAltGr.jpg
```

### 🎨 Layout Preview

The layout maintains the Programmer Dvorak finger positions while adding Spanish character support through AltGr combinations. For detailed layout images and key mappings, see the [Windows images folder](Windows/images/).

### 🤝 Contributing

Contributions are welcome! If you'd like to:

-   Report bugs or issues
-   Suggest improvements
-   Add support for other platforms
-   Improve documentation

Please feel free to open an issue or submit a pull request.

### 📄 License

This project is available under an open license. Feel free to use, modify, and distribute according to your needs.

---

## Español

### 📋 Descripción

**Dvorak Programmer ES ISO** es una distribución de teclado personalizada que combina los beneficios ergonómicos del layout Programmer Dvorak con soporte completo para los caracteres del idioma español. Esta distribución está especialmente diseñada para desarrolladores y programadores que escriben código en inglés mientras también necesitan escribir en español.

### ✨ Características Principales

-   🎯 **Base Programmer Dvorak** - Los números requieren Shift (símbolos accesibles sin Shift para programar más rápido)
-   🇪🇸 **Soporte completo para español** - Incluye ñ, á, é, í, ó, ú y otros caracteres españoles
-   ⌨️ **Compatible con teclados ISO** - Diseñado para el layout físico de teclado europeo/español
-   💻 **Multiplataforma** - Disponible para Linux y Windows
-   🔧 **Ergonómico** - Optimizado para reducir el movimiento de los dedos y mejorar la comodidad al escribir
-   🚀 **Enfocado en programación** - Símbolos comunes de programación en posiciones fácilmente accesibles

### 🎯 ¿Para quién es esto?

Esta distribución es perfecta para:

-   Desarrolladores y programadores hispanohablantes
-   Cualquiera que programe principalmente en inglés pero también escriba en español
-   Usuarios que buscan una alternativa más ergonómica a QWERTY
-   Entusiastas de Dvorak que necesitan soporte para caracteres españoles

### 📦 Instalación

Elige tu sistema operativo a continuación para obtener instrucciones detalladas de instalación:

#### 🐧 Instalación en Linux

Para usuarios de Linux (sistemas X11/XKB), consulta la guía completa:

👉 **[Guía de Instalación para Linux](Linux/README.md)**

La versión de Linux incluye:

-   Script de instalación automatizado con menú interactivo
-   Soporte para múltiples layouts en un sistema modular
-   Respaldo y restauración automática de archivos del sistema
-   Proceso de desinstalación limpio

#### 🪟 Instalación en Windows

Para usuarios de Windows, consulta la guía específica para Windows:

👉 **[Guía de Instalación para Windows](Windows/README.md)**

La versión de Windows incluye:

-   Instalador pre-compilado (archivos DLL incluidos en `dist.zip`)
-   Archivo `.klc` editable para Microsoft Keyboard Layout Creator 1.4
-   Instrucciones de instalación paso a paso

### 🗂️ Estructura del Proyecto

```
dvp-es/
├── README.md                          # Este archivo (resumen del proyecto)
├── Linux/                             # Archivos de instalación para Linux
│   ├── README.md                      # Guía de instalación para Linux
│   ├── install.sh                     # Script de instalación automatizado
│   └── layouts/                       # Definiciones de layouts
│       └── dvp_es_iso/
│           ├── dvp_es_iso.xkb        # Definición de símbolos XKB
│           ├── dvp_es_iso.xml        # Metadatos XKB
│           └── dvp_es_iso.lst        # Entradas de listado XKB
└── Windows/                           # Archivos de instalación para Windows
    ├── README.md                      # Guía de instalación para Windows
    ├── spanish-programmer-dvorak.klc  # Código fuente del Keyboard Layout Creator
    ├── dist.zip                       # Instalador pre-compilado (DLLs)
    └── images/                        # Imágenes de referencia del layout
        ├── prgdvkes.jpg
        ├── prgdvkesShft.jpg
        ├── prgdvkesAltGr.jpg
        ├── prgdvkesCaps.jpg
        └── prgdvkesShftAltGr.jpg
```

### 🎨 Vista Previa del Layout

La distribución mantiene las posiciones de los dedos del Programmer Dvorak mientras añade soporte para caracteres españoles mediante combinaciones con AltGr. Para imágenes detalladas del layout y mapeo de teclas, consulta la [carpeta de imágenes de Windows](Windows/images/).

### 🤝 Contribuciones

¡Las contribuciones son bienvenidas! Si deseas:

-   Reportar errores o problemas
-   Sugerir mejoras
-   Añadir soporte para otras plataformas
-   Mejorar la documentación

No dudes en abrir un issue o enviar un pull request.

### 📄 Licencia

Este proyecto está disponible bajo una licencia abierta. Siéntete libre de usar, modificar y distribuir según tus necesidades.
