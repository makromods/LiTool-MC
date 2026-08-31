#!/data/data/com.termux/files/usr/bin/bash

set -e

echo "⚡ Installing LiTool MC..."
echo

INSTALL_DIR="$HOME/litool-mc"
SOURCE_DIR="$(cd "$(dirname "$0")" && pwd)"

rm -rf "$INSTALL_DIR"
mkdir -p "$INSTALL_DIR"

cp -r "$SOURCE_DIR"/* "$INSTALL_DIR"/

chmod +x "$INSTALL_DIR/litool"
chmod +x "$INSTALL_DIR/tools/"*.sh

mkdir -p "$PREFIX/bin"
ln -sf "$INSTALL_DIR/litool" "$PREFIX/bin/litool"

echo
echo "✅ LiTool MC installed successfully!"
echo
echo "Run:"
echo "  litool"
echo