#!/bin/bash

# Check and require root privileges using bash env variable
if [ "$EUID" -ne 0 ]; then
	echo "Please run as root"
	exit 1
fi

# Paths
SYMBOLS_DIR="/usr/share/X11/xkb/symbols"
RULES_DIR="/usr/share/X11/xkb/rules"
EVDEV_XML_DEST="$RULES_DIR/base.xml"
EVDEV_LST_DEST="$RULES_DIR/base.lst"
LAYOUTS_SRC_DIR="./layouts"
LAYOUT_NAME=""
SRC_SYMBOLS="" # xkb file
SRC_RULES="" # xml file
SRC_LST="" # lst file
RULES_INSTALLED=false
SYMBOLS_INSTALLED=false
LST_INSTALLED=false

# Menu functions
select_layout() {
    echo "Please select a layout to manage:"
	echo "0) Exit"
    echo "1) Spanish (Programmer Dvorak) -> dvp_es_iso"
    read -p "Enter the number of your choice: " layout_choice

    case "$layout_choice" in
		0) exit 0;;
        1) LAYOUT_NAME="dvp_es_iso";;
        *) echo "Invalid choice."; select_layout;;
    esac

	select_layout_action
}

select_layout_action() {
	echo "Select an action for layout $LAYOUT_NAME:"
	echo "0) Exit"
	echo "1) Install layout"
	echo "2) Uninstall layout and restore backup"
	read -p "Enter the number of your choice: " layout_action_choice

	case "$layout_action_choice" in
		0) exit 0;;
		1) install_layout;;
		2) uninstall_restore_backup;;
		*) echo "Invalid choice."; select_layout_action;;
	esac
}

# Main logic
install_layout() {
	set_paths
	check_paths
	check_installation
	make_backup

	if $SYMBOLS_INSTALLED; then
		echo "Layout $LAYOUT_NAME symbols already installed. Skipping..."
	else
		echo "Installing symbols..."
		local dst_symbols="$SYMBOLS_DIR/$LAYOUT_NAME"
		sudo install -m 0644 "$SRC_SYMBOLS" "$dst_symbols"
	fi

	if $RULES_INSTALLED; then
		echo "Layout $LAYOUT_NAME rules entry already installed. Skipping..."
	else
		echo "Adding rules entry..."
		local SRC_SYMBOLS="$LAYOUTS"
		sed -i "/<\/layoutList>/e cat $SRC_RULES" "$EVDEV_XML_DEST"
	fi

	if $LST_INSTALLED; then
		echo "Layout $LAYOUT_NAME list entry already installed. Skipping..."
	else
		echo "Adding list entry..."
		inject_lst_entries
	fi

	echo "Installation finished. You may need to restart your X session for changes to take effect."
}

uninstall_restore_backup() {
	check_installation
	if ! $SYMBOLS_INSTALLED && ! $RULES_INSTALLED && ! $LST_INSTALLED; then
		echo "Layout $LAYOUT_NAME not found in system. Nothing to uninstall or restore. Exiting..."
		exit 0
	fi
	
	if $SYMBOLS_INSTALLED; then
		echo "Removing layout $LAYOUT_NAME symbols..."
		rm "$SYMBOLS_DIR/$LAYOUT_NAME"
	else
		echo "Layout $LAYOUT_NAME symbols not found. Skipping..."
	fi

	restore_backup
}

# Program functions
set_paths() {
	SRC_SYMBOLS="$LAYOUTS_SRC_DIR/$LAYOUT_NAME/$LAYOUT_NAME.xkb"
	SRC_RULES="$LAYOUTS_SRC_DIR/$LAYOUT_NAME/$LAYOUT_NAME.xml"
	SRC_LST="$LAYOUTS_SRC_DIR/$LAYOUT_NAME/$LAYOUT_NAME.lst"
}

check_paths() {
	if [ ! -d "$SYMBOLS_DIR" ] || [ ! -d "$RULES_DIR" ]; then
		echo "Required destination directories do not exist. Are you sure this script is compatible with your system? Exiting..."
		exit 1
	fi

	if [ ! -f "$SRC_SYMBOLS" ] || [ ! -f "$SRC_RULES" ]; then
		echo "Source files for $LAYOUT_NAME does not exist in the source directory. Exiting..."
		exit 1
	fi
}

check_installation() {
	if [ -f "$SYMBOLS_DIR/$LAYOUT_NAME" ]; then
		SYMBOLS_INSTALLED=true
	fi

	if grep -q "$LAYOUT_NAME" "$EVDEV_XML_DEST"; then
		RULES_INSTALLED=true
	fi

	if grep -q "$LAYOUT_NAME" "$EVDEV_LST_DEST"; then
		LST_INSTALLED=true
	fi
}

inject_lst_entries() {
	local src_file="$SRC_LST"
	local dest_file="$EVDEV_LST_DEST"
	local current_section=""

	# Read line by line the source file
	while IFS= read -r line || [ -n "$line" ]; do
		# Detect section headers
		if [[ $line =~ ^!\ (.+)$ ]]; then
			current_section="${BASH_REMATCH[1]}"
			
			# If section doesn't exist in the destination file, ignore it
			if ! grep -q "^! ${current_section}$" "$dest_file"; then
				echo "  Warning: Section '${current_section}' not found in ${dest_file}"
				current_section=""
			fi

		# Detect entries under the current section
		elif [[ $line =~ ^[[:space:]]+(.+)$ ]] && [[ -n $current_section ]]; then
			sed -i "/^! ${current_section}$/a\\${line}" "$dest_file"
			echo "  Added entry to section '${current_section}'"
		fi
	done < "$src_file"
}

make_backup() {
	echo "Backing up existing configuration files..."
	cp "$EVDEV_XML_DEST" "$EVDEV_XML_DEST.bak"
	cp "$EVDEV_LST_DEST" "$EVDEV_LST_DEST.bak"
}

restore_backup() {
	if [ ! -f "$EVDEV_XML_DEST.bak" ]; then
		echo "Backup file \"evdev.xml.bak\" not found. Cannot restore."
	else
		echo "Restoring $EVDEV_XML_DEST from backup..."
		cp "$EVDEV_XML_DEST.bak" "$EVDEV_XML_DEST"
	fi

	if [ ! -f "$EVDEV_LST_DEST.bak" ]; then
		echo "Backup file \"evdev.lst.bak\" not found. Cannot restore."
	else
		echo "Restoring $EVDEV_LST_DEST from backup..."
		cp "$EVDEV_LST_DEST.bak" "$EVDEV_LST_DEST"
	fi
}

# Start script
select_layout