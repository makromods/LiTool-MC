#!/data/data/com.termux/files/usr/bin/bash

set -e

REPO="https://github.com/makromods/LiTool-MC.git"
INSTALL_DIR="$HOME/litool-mc"

echo "⚡ Installing LiTool MC..."
echo

if [ -d "$INSTALL_DIR/.git" ]; then
    echo "🔄 Updating existing installation..."
    git -C "$INSTALL_DIR" pull --ff-only
else
    echo "📥 Downloading LiTool MC..."
    rm -rf "$INSTALL_DIR"
    git clone "$REPO" "$INSTALL_DIR"
fi

chmod +x "$INSTALL_DIR/litool"
chmod +x "$INSTALL_DIR/tools/"*.sh

mkdir -p "$PREFIX/bin"
ln -sf "$INSTALL_DIR/litool" "$PREFIX/bin/litool"

echo
echo "╔══════════════════════════════════╗"
echo "║      ✅ LiTool MC Installed      ║"
echo "╚══════════════════════════════════╝"
echo
echo "Run: litool"
