#!/data/data/com.termux/files/usr/bin/bash
read -p "Project path [$HOME/LiToolProjects]: " P
P="${P:-$HOME/LiToolProjects}"
[ -d "$P" ] || { echo "Project not found."; exit 1; }
cd "$P" || exit 1
if [ -f gradlew ]; then chmod +x gradlew; ./gradlew build
elif command -v gradle >/dev/null 2>&1; then gradle build
else
 echo "Gradle not found. Install it or use a project containing gradlew."
 exit 1
fi
echo; echo "JAR files:"
ls -lh build/libs/*.jar 2>/dev/null || true
