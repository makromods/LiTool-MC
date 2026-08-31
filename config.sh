#!/data/data/com.termux/files/usr/bin/bash
read -p "Project path: " P
mkdir -p "$P/src/main/resources"
cat > "$P/src/main/resources/config.yml" <<'EOF'
settings:
  enabled: true
  message: "&aHello from LiTool MC!"
EOF
echo "config.yml generated."
