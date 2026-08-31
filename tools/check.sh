#!/data/data/com.termux/files/usr/bin/bash
echo "=== Environment Check ==="
for x in java git unzip zip; do printf "%-8s " "$x"; command -v "$x" || echo "NOT FOUND"; done
echo; java -version 2>&1 | head -n 1
echo "Projects: $HOME/LiToolProjects"
