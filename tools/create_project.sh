#!/data/data/com.termux/files/usr/bin/bash
BASE="$HOME/LiToolProjects"; mkdir -p "$BASE"
echo "=== Create Paper Plugin Project ==="
read -p "Plugin name: " NAME
read -p "Author: " AUTHOR
read -p "Package (me.example.plugin): " PACKAGE
read -p "Paper API version [1.21.8]: " MCVER
MCVER="${MCVER:-1.21.8}"
read -p "Main class [Main]: " MAIN
MAIN="${MAIN:-Main}"
[ -z "$NAME" ] || [ -z "$PACKAGE" ] && { echo "Name and package are required."; exit 1; }
PROJECT="$BASE/$(echo "$NAME" | tr ' /' '__')"
PKG_PATH=$(echo "$PACKAGE" | tr '.' '/')
mkdir -p "$PROJECT/src/main/java/$PKG_PATH" "$PROJECT/src/main/resources"
cat > "$PROJECT/settings.gradle" <<EOF
pluginManagement { repositories { gradlePluginPortal(); mavenCentral() } }
rootProject.name = '$NAME'
EOF
cat > "$PROJECT/build.gradle" <<EOF
plugins { id 'java' }
group = '$PACKAGE'
version = '1.0.0'
repositories {
    mavenCentral()
    maven { url = 'https://repo.papermc.io/repository/maven-public/' }
}
dependencies {
    compileOnly 'io.papermc.paper:paper-api:$MCVER-R0.1-SNAPSHOT'
}
java { toolchain { languageVersion = JavaLanguageVersion.of(21) } }
tasks.withType(JavaCompile).configureEach { options.encoding = 'UTF-8' }
EOF
cat > "$PROJECT/src/main/resources/plugin.yml" <<EOF
name: $NAME
version: 1.0.0
main: $PACKAGE.$MAIN
api-version: '$MCVER'
author: $AUTHOR
description: Created with LiTool MC
EOF
cat > "$PROJECT/src/main/java/$PKG_PATH/$MAIN.java" <<EOF
package $PACKAGE;
import org.bukkit.plugin.java.JavaPlugin;
public final class $MAIN extends JavaPlugin {
    @Override public void onEnable() { getLogger().info("$NAME enabled!"); }
    @Override public void onDisable() { getLogger().info("$NAME disabled!"); }
}
EOF
echo "Project created: $PROJECT"
echo "Open this folder in your code editor, then use LiTool → Build."
