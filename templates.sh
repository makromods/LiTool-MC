#!/data/data/com.termux/files/usr/bin/bash
echo "=== Plugin Templates ==="
echo "1. Basic Plugin"; echo "2. Command Plugin"; echo "3. Join Message Plugin"; echo "4. Listener Plugin"
read -p "Choose: " N
case "$N" in
1) echo "Create Plugin Project → basic project.";;
2) echo "Create project → Command Generator.";;
3) echo "Create project → Listener → PlayerJoinEvent.";;
4) echo "Create project → Listener Generator.";;
*) echo "Invalid option.";;
esac
