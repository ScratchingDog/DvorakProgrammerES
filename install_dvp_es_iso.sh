#/bin/bash

# Archivo fuente y destino
SRC="dvp-es-iso.xkb"
DST="/usr/share/X11/xkb/symbols/dvp-es-iso"

# 1. Comprobar si el archivo fuente existe
if [ ! -f "$SRC" ]; then
	echo "ERROR: No se encuentra el archivo $SRC en el directorio actual."
	exit 1
fi

# 2. Copiar el archivo usando sudo si es necesario
sudo cp "$SRC" "$DST"

# 3. Recarga las reglas de XKB
echo "Recargando reglas de XKB..."
sudo udevadm trigger --subsystem-match=input --action=change

# Recarga básica de XKB para la sesión actual
setxkbmap

echo "Archivo copiado y reglas recargadas. El layout dvp-es-iso está disponible."