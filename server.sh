#!/data/data/com.termux/files/usr/bin/bash
echo "1. Java version"; echo "2. List server directory"; echo "3. List plugins"
read -p "Choose: " N
case "$N" in
1) java -version;;
2) read -p "Server path: " P; ls -lah "$P";;
3) read -p "Plugins folder: " P; ls -lh "$P"/*.jar 2>/dev/null || echo "No JAR files.";;
*) echo "Invalid.";;
esac
