#!/data/data/com.termux/files/usr/bin/bash
echo "=== LiTool MC Development Setup ==="
pkg update -y
pkg install -y openjdk-21 git wget unzip zip
echo
java -version
echo
echo "Setup complete."
echo "Global Gradle is optional: LiTool projects can use Gradle Wrapper."
