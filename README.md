# Dvorak Programmer ES ISO for Linux

[Go to English](#english) | [Ir a Español](#español)

---

## English

### 📋 Description

This repository provides a complete system for installing and managing custom keyboard layouts on Linux systems based on X11. It includes an implementation of the **Programmer Dvorak layout adapted for Spanish** on ISO keyboards, along with an automated installation script that facilitates the management of custom layouts.

### ✨ Features

-   🔧 **Automated installation** of custom layouts
-   💾 **Automatic backup** of existing configurations
-   🔄 **Clean uninstallation** with backup restoration
-   🎯 **Intelligent detection** of already installed layouts
-   📦 **Modular system** that makes it easy to add new layouts
-   ⚡ **Compatible** with standard X11/XKB systems

### 🗂️ Project Structure

```
dvp-es/
├── install.sh                    # Main installation script
├── layouts/
│   └── dvp_es_iso/              # Programmer Dvorak ES ISO layout
│       ├── dvp_es_iso.xkb       # Keyboard symbols definition
│       ├── dvp_es_iso.xml       # Metadata for XKB system
│       └── dvp_es_iso.lst       # Entries for layouts listing
├── add_dvp_es_iso_layout.sh     # Legacy script (not recommended)
├── install_dvp_es_iso.sh        # Legacy script (not recommended)
└── README.md                     # This file
```

### 🚀 Installation

#### Prerequisites

-   Linux system with X11 server
-   Superuser (root) privileges
-   XKB system installed (usually included by default)

#### Installation Steps

1. **Clone or download the repository:**

    ```bash
    git clone https://github.com/ScratchingDog/DvorakProgrammerES.git
    cd DvorakProgrammerES
    ```

2. **Run the installation script as root:**

    ```bash
    sudo ./install.sh
    ```

3. **Follow the interactive menu:**

    - Select the layout to install (currently: `dvp_es_iso`)
    - Choose the desired action (Install/Uninstall)

4. **Apply the layout:**
    - Restart the X session, or
    - Select the new layout from system settings

### 🎮 Script Usage

The [`install.sh`](install.sh) script provides an interactive menu with the following options:

#### Main Menu

```
Please select a layout to manage:
0) Exit
1) Spanish (Programmer Dvorak) -> dvp_es_iso
```

#### Actions Menu

```
Select an action for layout dvp_es_iso:
0) Exit
1) Install layout
2) Uninstall layout and restore backup
```

### 🔍 Technical Operation

#### Installation Process

1. **Privilege validation**: Verifies the script runs as root
2. **Path verification**: Checks the existence of XKB system directories
3. **Status detection**: Analyzes if the layout is already installed (partially or completely)
4. **Safety backup**: Creates backup copies of `base.xml` and `base.lst`
5. **Modular installation**:
    - Copies the `.xkb` file to `/usr/share/X11/xkb/symbols/`
    - Injects XML rules into `/usr/share/X11/xkb/rules/base.xml`
    - Adds entries to the listing in `/usr/share/X11/xkb/rules/base.lst`

#### Uninstallation Process

1. **Verification**: Checks if the layout is installed
2. **Symbol removal**: Deletes the file from the `symbols/` directory
3. **Backup restoration**: Recovers original versions of `base.xml` and `base.lst`

### 📁 Layout Files

#### [`dvp_es_iso.xkb`](layouts/dvp_es_iso/dvp_es_iso.xkb)

Contains the complete keyboard layout definition:

-   Key mapping without modifiers
-   Mapping with Shift
-   Mapping with AltGr (level 3)
-   Mapping with Shift+AltGr (level 4)

**Layout highlights:**

-   Numbers accessible with Shift (optimized for programming)
-   Programming symbols in ergonomic positions
-   Spanish characters (ñ, accents) integrated
-   Special symbols (€, ©, ®, ™, £) via AltGr

#### [`dvp_es_iso.xml`](layouts/dvp_es_iso/dvp_es_iso.xml)

Defines layout metadata:

-   Internal name (`dvp_es_iso`)
-   Visible description ("Spanish (Programmer Dvorak)")
-   ISO 639 language code

#### [`dvp_es_iso.lst`](layouts/dvp_es_iso/dvp_es_iso.lst)

Provides entries for the system's available layouts listing.

### 🛠️ Adding New Layouts

To add a new custom layout:

1. **Create layout directory:**

    ```bash
    mkdir -p layouts/layout_name
    ```

2. **Create necessary files:**

    - `layout_name.xkb` - Keyboard definition
    - `layout_name.xml` - Metadata
    - `layout_name.lst` - Listing entries

3. **Modify the [`install.sh`](install.sh) script:**

    ```bash
    # In the select_layout() function, add:
    echo "2) Layout Description -> layout_name"

    # In the case statement:
    2) LAYOUT_NAME="layout_name";;
    ```

4. **Run installation:**
    ```bash
    sudo ./install.sh
    ```

### ⚠️ Important Notes

-   **Automatic backups**: The script automatically creates `base.xml.bak` and `base.lst.bak`
-   **Intelligent detection**: Avoids duplicating partial or complete installations
-   **Safe restoration**: Uninstallation restores original files from backups
-   **Compatibility**: Designed for standard X11 systems (tested on Ubuntu/Debian)

### 🐛 Troubleshooting

#### Layout doesn't appear after installation

-   Completely restart the X session
-   Verify that files were copied correctly to `/usr/share/X11/xkb/`

#### Permission error

-   Make sure to run the script with `sudo`

#### Failed restoration

-   Verify the existence of `.bak` files in `/usr/share/X11/xkb/rules/`
-   Reinstall the `xkb-data` package if necessary

### 📜 Legacy Scripts

The files [`add_dvp_es_iso_layout.sh`](add_dvp_es_iso_layout.sh) and [`install_dvp_es_iso.sh`](install_dvp_es_iso.sh) are older versions of the installation system and **their use is not recommended**. Use [`install.sh`](install.sh) instead.

---

## Español

### 📋 Descripción

Este repositorio proporciona un sistema completo para instalar y gestionar layouts de teclado personalizados en sistemas Linux basados en X11. Incluye una implementación del layout **Programmer Dvorak adaptado al español** para teclados ISO, junto con un script de instalación automatizado que facilita la gestión de layouts personalizados.

### ✨ Características

-   🔧 **Instalación automatizada** de layouts personalizados
-   💾 **Respaldo automático** de configuraciones existentes
-   🔄 **Desinstalación limpia** con restauración de backups
-   🎯 **Detección inteligente** de layouts ya instalados
-   📦 **Sistema modular** que facilita añadir nuevos layouts
-   ⚡ **Compatible** con sistemas X11/XKB estándar

### 🗂️ Estructura del Proyecto

```
dvp-es/
├── install.sh                    # Script principal de instalación
├── layouts/
│   └── dvp_es_iso/              # Layout Programmer Dvorak ES ISO
│       ├── dvp_es_iso.xkb       # Definición de símbolos del teclado
│       ├── dvp_es_iso.xml       # Metadatos para el sistema XKB
│       └── dvp_es_iso.lst       # Entradas para el listado de layouts
├── add_dvp_es_iso_layout.sh     # Script legacy (no recomendado)
├── install_dvp_es_iso.sh        # Script legacy (no recomendado)
└── README.md                     # Este archivo
```

### 🚀 Instalación

#### Requisitos Previos

-   Sistema Linux con servidor X11
-   Privilegios de superusuario (root)
-   Sistema XKB instalado (generalmente incluido por defecto)

#### Pasos de Instalación

1. **Clonar o descargar el repositorio:**

    ```bash
    git clone https://github.com/ScratchingDog/DvorakProgrammerES.git
    cd DvorakProgrammerES
    ```

2. **Ejecutar el script de instalación como root:**

    ```bash
    sudo ./install.sh
    ```

3. **Seguir el menú interactivo:**

    - Seleccionar el layout a instalar (actualmente: `dvp_es_iso`)
    - Elegir la acción deseada (Instalar/Desinstalar)

4. **Aplicar el layout:**
    - Reiniciar la sesión X, o
    - Seleccionar el nuevo layout desde la configuración del sistema

### 🎮 Uso del Script

El script [`install.sh`](install.sh) proporciona un menú interactivo con las siguientes opciones:

#### Menú Principal

```
Please select a layout to manage:
0) Exit
1) Spanish (Programmer Dvorak) -> dvp_es_iso
```

#### Menú de Acciones

```
Select an action for layout dvp_es_iso:
0) Exit
1) Install layout
2) Uninstall layout and restore backup
```

### 🔍 Funcionamiento Técnico

#### Proceso de Instalación

1. **Validación de privilegios**: Verifica que el script se ejecute como root
2. **Verificación de rutas**: Comprueba la existencia de directorios del sistema XKB
3. **Detección de estado**: Analiza si el layout ya está instalado (parcial o completamente)
4. **Respaldo de seguridad**: Crea copias de seguridad de `base.xml` y `base.lst`
5. **Instalación modular**:
    - Copia el archivo `.xkb` a `/usr/share/X11/xkb/symbols/`
    - Inyecta las reglas XML en `/usr/share/X11/xkb/rules/base.xml`
    - Añade entradas al listado en `/usr/share/X11/xkb/rules/base.lst`

#### Proceso de Desinstalación

1. **Verificación**: Comprueba si el layout está instalado
2. **Eliminación de símbolos**: Borra el archivo del directorio `symbols/`
3. **Restauración de backups**: Recupera las versiones originales de `base.xml` y `base.lst`

### 📁 Archivos del Layout

#### [`dvp_es_iso.xkb`](layouts/dvp_es_iso/dvp_es_iso.xkb)

Contiene la definición completa del layout del teclado:

-   Mapeo de teclas sin modificadores
-   Mapeo con Shift
-   Mapeo con AltGr (nivel 3)
-   Mapeo con Shift+AltGr (nivel 4)

**Características destacadas del layout:**

-   Números accesibles con Shift (optimizado para programación)
-   Símbolos de programación en posiciones ergonómicas
-   Caracteres españoles (ñ, acentos) integrados
-   Símbolos especiales (€, ©, ®, ™, £) mediante AltGr

#### [`dvp_es_iso.xml`](layouts/dvp_es_iso/dvp_es_iso.xml)

Define los metadatos del layout:

-   Nombre interno (`dvp_es_iso`)
-   Descripción visible ("Spanish (Programmer Dvorak)")
-   Código de idioma ISO 639

#### [`dvp_es_iso.lst`](layouts/dvp_es_iso/dvp_es_iso.lst)

Proporciona entradas para el listado de layouts disponibles en el sistema.

### 🛠️ Añadir Nuevos Layouts

Para añadir un nuevo layout personalizado:

1. **Crear directorio del layout:**

    ```bash
    mkdir -p layouts/nombre_del_layout
    ```

2. **Crear los archivos necesarios:**

    - `nombre_del_layout.xkb` - Definición del teclado
    - `nombre_del_layout.xml` - Metadatos
    - `nombre_del_layout.lst` - Entradas de listado

3. **Modificar el script [`install.sh`](install.sh):**

    ```bash
    # En la función select_layout(), añadir:
    echo "2) Descripción del Layout -> nombre_del_layout"

    # En el case statement:
    2) LAYOUT_NAME="nombre_del_layout";;
    ```

4. **Ejecutar la instalación:**
    ```bash
    sudo ./install.sh
    ```

### ⚠️ Notas Importantes

-   **Backups automáticos**: El script crea automáticamente `base.xml.bak` y `base.lst.bak`
-   **Detección inteligente**: Evita duplicar instalaciones parciales o completas
-   **Restauración segura**: La desinstalación restaura los archivos originales desde los backups
-   **Compatibilidad**: Diseñado para sistemas X11 estándar (probado en Ubuntu/Debian)

### 🐛 Solución de Problemas

#### El layout no aparece después de la instalación

-   Reiniciar la sesión X completamente
-   Verificar que los archivos se copiaron correctamente en `/usr/share/X11/xkb/`

#### Error de permisos

-   Asegurarse de ejecutar el script con `sudo`

#### Restauración fallida

-   Verificar la existencia de archivos `.bak` en `/usr/share/X11/xkb/rules/`
-   Reinstalar el paquete `xkb-data` si es necesario

### 📜 Scripts Legacy

Los archivos [`add_dvp_es_iso_layout.sh`](add_dvp_es_iso_layout.sh) e [`install_dvp_es_iso.sh`](install_dvp_es_iso.sh) son versiones anteriores del sistema de instalación y **no se recomienda su uso**. Utilizar [`install.sh`](install.sh) en su lugar.

---

### 📄 Licencia / License

Este proyecto está disponible bajo una licencia abierta. Siéntete libre de usar, modificar y distribuir según tus necesidades.

This project is available under an open license. Feel free to use, modify, and distribute according to your needs.

### 🤝 Contribuciones / Contributing

¡Las contribuciones son bienvenidas! Si quieres añadir nuevos layouts o mejorar el script de instalación, no dudes en abrir un issue o enviar un pull request.

Contributions are welcome! If you want to add new layouts or improve the installation script, feel free to open an issue or submit a pull request.
