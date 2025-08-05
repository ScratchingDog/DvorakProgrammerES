#/bin/bash

# Archivo fuente y destino
SRC="dvp-es-ansi.xkb"
DST="/usr/share/X11/xkb/symbols/dvp-es-ansi"

# 1. Comprobar si el archivo fuente existe
if [ ! -f "$SRC" ]; then
	echo "ERROR: No se encuentra el archivo $SRC en el directorio actual."
	exit 1
fi

# 2. Copiar el archivo usando sudo si es necesario
if [ -w "$(dirname "$DST")" ]; then
	cp "$SRC" "$DST"
else
	sudo cp "$SRC" "$DST"
fi

# 3. Recarga las reglas de XKB
echo "Recargando reglas de XKB..."
if command -v udevadm >/dev/null 2>&1; then
	sudo udevadm trigger --subsystem-match=input --action=change
fi

# Recarga básica de XKB para la sesión actual
if command -v setxkbmap >/dev/null 2>&1; then
	setxkbmap
fi

echo "Archivo copiado y reglas recargadas. El layout dvp-es-ansi está disponible."