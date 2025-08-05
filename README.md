# Dvorak Programmer ES ANSI para XKB

[Ir a Español](#espa%C3%B1ol) | [Go to English](#english)

---

## Español

### Índice

- [Requisitos previos](#requisitos-previos)
- [Instalación](#instalaci%C3%B3n)
- [Verificación](#verificaci%C3%B3n)
- [Solución de problemas](#soluci%C3%B3n-de-problemas)
- [Restaurar copia de seguridad](#restaurar-copia-de-seguridad)
- [Desinstalación](#desinstalaci%C3%B3n)

---

### Requisitos previos

- Sistema Linux con entorno X11.
- Permisos de administrador (sudo).

### Instalación

> **Importante:** El archivo `dvp-es-ansi.xkb` debe estar en el mismo directorio que los scripts antes de comenzar.

Sigue estos pasos en orden:

1. **Instala el archivo de layout:**

   ```bash
   ./install_dvp_es_ansi.sh
   ```

   Este script copia `dvp-es-ansi.xkb` a `/usr/share/X11/xkb/symbols/dvp-es-ansi` y recarga XKB.

2. **Añade el layout al sistema:**

   ```bash
   ./add_dvp_es_ansi_layout.sh
   ```

   Este script hace una copia de seguridad de `evdev.xml`, añade la definición del layout y recarga XKB.

---

### Verificación

Para comprobar que el layout está disponible en el sistema, ejecuta:

```bash
localectl list-x11-keymap-layouts | grep dvp
```

Debería aparecer `dvp-es-ansi` en la lista.

Para seleccionarlo, usa la herramienta de configuración de tu entorno de escritorio (por ejemplo, Configuración de teclado en GNOME/KDE), y busca el layout con el nombre:

- **Spanish (Programmer Dvorak ES ANSI)**

---

### Solución de problemas

- **ERROR: No se encuentra el archivo `dvp-es-ansi.xkb` en el directorio actual.**  
  Asegúrate de que el archivo está en el mismo directorio que los scripts antes de ejecutar `install_dvp_es_ansi.sh`.

- **Permiso denegado o problemas con sudo:**  
  Los scripts usan `sudo` automáticamente. Si ves errores de permisos, revisa que tienes privilegios de administrador.

- **El layout no aparece tras instalarlo:**  
  1. Cierra la sesión y vuelve a entrar, o reinicia el entorno gráfico.
  2. Comprueba que `/usr/share/X11/xkb/symbols/dvp-es-ansi` existe y contiene el layout.
  3. Verifica que el bloque de layout está en `/usr/share/X11/xkb/rules/evdev.xml`.

- **Modificación de archivos de sistema:**  
  Modificar archivos del sistema puede afectar al funcionamiento del teclado. Siempre se realiza una copia de seguridad de `evdev.xml` antes de modificarlo.

---

### Restaurar copia de seguridad

Si necesitas revertir los cambios realizados en `evdev.xml`:

```bash
cd /usr/share/X11/xkb/rules/
sudo mv evdev.xml.bak evdev.xml
```

Reinicia el entorno gráfico o el sistema para aplicar los cambios.

---

### Desinstalación

1. Elimina el archivo de layout:

   ```bash
   sudo rm /usr/share/X11/xkb/symbols/dvp-es-ansi
   ```

2. Restaura la copia de seguridad de `evdev.xml` como se indica más arriba.

---

## English

### Table of Contents

- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Verification](#verification)
- [Troubleshooting](#troubleshooting)
- [Restore Backup](#restore-backup)
- [Uninstallation](#uninstallation)

---

### Prerequisites

- Linux system with X11 environment.
- Administrator (sudo) privileges.

### Installation

> **Important:** File `dvp-es-ansi.xkb` must be in the same directory as the scripts before starting.

Follow these steps in order:

1. **Install the layout file:**

   ```bash
   ./install_dvp_es_ansi.sh
   ```

   This script copies `dvp-es-ansi.xkb` to `/usr/share/X11/xkb/symbols/dvp-es-ansi` and reloads XKB.

2. **Add the layout to the system:**

   ```bash
   ./add_dvp_es_ansi_layout.sh
   ```

   This script backs up `evdev.xml`, adds the layout definition, and reloads XKB.

---

### Verification

To check that the layout is available, run:

```bash
localectl list-x11-keymap-layouts | grep dvp
```

You should see `dvp-es-ansi` in the list.

To select it, use your desktop environment’s keyboard settings and look for the layout named:

- **Spanish (Programmer Dvorak ES ANSI)**

---

### Troubleshooting

- **ERROR: File `dvp-es-ansi.xkb` not found in the current directory.**  
  Make sure the file is in the same directory as the scripts before running `install_dvp_es_ansi.sh`.

- **Permission denied or sudo issues:**  
  The scripts use `sudo` automatically. If you get permission errors, ensure you have administrator privileges.

- **Layout does not appear after installation:**  
  1. Log out and back in, or restart your graphical session.
  2. Check that `/usr/share/X11/xkb/symbols/dvp-es-ansi` exists and contains the layout.
  3. Verify that the layout block is present in `/usr/share/X11/xkb/rules/evdev.xml`.

- **System file modification warning:**  
  Modifying system files may affect keyboard functionality. The script always creates a backup of `evdev.xml` before making changes.

---

### Restore Backup

If you need to revert changes to `evdev.xml`:

```bash
cd /usr/share/X11/xkb/rules/
sudo mv evdev.xml.bak evdev.xml
```

Restart your graphical session or the system to apply changes.

---

### Uninstallation

1. Remove the layout file:

   ```bash
   sudo rm /usr/share/X11/xkb/symbols/dvp-es-ansi
   ```

2. Restore the backup of `evdev.xml` as above.

---