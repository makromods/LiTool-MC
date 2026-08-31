#!/data/data/com.termux/files/usr/bin/bash
read -p "Project path: " P
read -p "Package: " PACKAGE
read -p "Class name [MyCommand]: " CLASS; CLASS="${CLASS:-MyCommand}"
read -p "Command name: " CMD
read -p "Permission (optional): " PERM
DIR="$P/src/main/java/$(echo "$PACKAGE"|tr '.' '/')"; mkdir -p "$DIR"
cat > "$DIR/$CLASS.java" <<EOF
package $PACKAGE;
import org.bukkit.command.Command;
import org.bukkit.command.CommandExecutor;
import org.bukkit.command.CommandSender;
public final class $CLASS implements CommandExecutor {
 @Override public boolean onCommand(CommandSender sender, Command command, String label, String[] args) {
  sender.sendMessage("§a/$CMD executed!");
  return true;
 }
}
EOF
Y="$P/src/main/resources/plugin.yml"
[ -f "$Y" ] && { echo >> "$Y"; echo "commands:" >> "$Y"; echo "  $CMD:" >> "$Y"; echo "    description: $CMD command" >> "$Y"; [ -n "$PERM" ] && echo "    permission: $PERM" >> "$Y"; }
echo "Created $DIR/$CLASS.java"
