#!/bin/bash

EVDEV_DIR="/usr/share/X11/xkb/rules/"
EVDEV_XML="evdev.xml"
BACKUP_XML="evdev.xml.bak"
LAYOUT_NAME="dvp-es-iso"

# 0. Ir al directorio
cd "$EVDEV_DIR"

# 1. Haz copia de seguridad
sudo cp "$EVDEV_XML" "$BACKUP_XML"

# 2. Comprueba si el layout ya existe
if grep -q "<name>$LAYOUT_NAME</name>" "$EVDEV_XML"; then
    echo "El layout '$LAYOUT_NAME' ya existe en $EVDEV_XML. No se hace nada."
    exit 0
fi

# 3. Define el bloque a insertar
read -r -d '' NEW_LAYOUT << EOM
    <layout>
      <configItem>
        <name>dvp-es-iso</name>
        <shortDescription>dvp</shortDescription>
        <description>Español (Programmer Dvorak)</description>
        <languageList>
          <iso639Id>spa</iso639Id>
        </languageList>
      </configItem>
      <variantList/>
    </layout>
EOM

# 4. Inserta el bloque antes de </layoutList>
# Creamos un archivo temporal
TMP_FILE=$(mktemp)
awk -v layout="$NEW_LAYOUT" '
    /<\/layoutList>/ && !x {
        print layout
        x=1
    }
    { print }
' "$EVDEV_XML" > "$TMP_FILE"

sudo mv "$TMP_FILE" "$EVDEV_XML"

# 5. Recargar los layout
# Recarga todo para la sesión actual de X
sudo setxkbmap
setxkbmap
# Recarga completa de XKB
sudo udevadm trigger --subsystem-match=input --action=change

echo "Layout añadido exitosamente."