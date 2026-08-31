#!/data/data/com.termux/files/usr/bin/bash
read -p "Project path: " P
read -p "Package: " PACKAGE
read -p "Class name: " CLASS
D="$P/src/main/java/$(echo "$PACKAGE"|tr '.' '/')"; mkdir -p "$D"
cat > "$D/$CLASS.java" <<EOF
package $PACKAGE;
public final class $CLASS {
}
EOF
echo "Created $D/$CLASS.java"
