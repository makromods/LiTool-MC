#!/data/data/com.termux/files/usr/bin/bash
read -p "Project path: " P
read -p "Package: " PACKAGE
read -p "Class name [JoinListener]: " CLASS; CLASS="${CLASS:-JoinListener}"
echo "1. PlayerJoinEvent"; echo "2. PlayerQuitEvent"; echo "3. BlockBreakEvent"; echo "4. PlayerInteractEvent"; echo "5. InventoryClickEvent"
read -p "Choose: " E
case "$E" in
1) IMP="org.bukkit.event.player.PlayerJoinEvent"; METHOD='public void onJoin(PlayerJoinEvent e) { e.getPlayer().sendMessage("§aWelcome!"); }';;
2) IMP="org.bukkit.event.player.PlayerQuitEvent"; METHOD='public void onQuit(PlayerQuitEvent e) { }';;
3) IMP="org.bukkit.event.block.BlockBreakEvent"; METHOD='public void onBreak(BlockBreakEvent e) { }';;
4) IMP="org.bukkit.event.player.PlayerInteractEvent"; METHOD='public void onInteract(PlayerInteractEvent e) { }';;
5) IMP="org.bukkit.event.inventory.InventoryClickEvent"; METHOD='public void onClick(InventoryClickEvent e) { }';;
*) echo "Invalid."; exit 1;;
esac
DIR="$P/src/main/java/$(echo "$PACKAGE"|tr '.' '/')"; mkdir -p "$DIR"
cat > "$DIR/$CLASS.java" <<EOF
package $PACKAGE;
import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import $IMP;
public final class $CLASS implements Listener {
 @EventHandler
 $METHOD
}
EOF
echo "Created listener."
