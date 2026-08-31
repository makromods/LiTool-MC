#!/data/data/com.termux/files/usr/bin/bash
read -p "Built JAR path: " J
[ -f "$J" ] || { echo "JAR not found."; exit 1; }
read -p "Server plugins folder: " P
[ -d "$P" ] || { echo "Folder not found."; exit 1; }
cp -v "$J" "$P/"
echo "Plugin copied successfully."
