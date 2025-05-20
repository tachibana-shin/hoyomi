#!/bin/bash

set -e

PUBSPEC="pubspec.yaml"
APP_NAME=$(grep "^name:" "$PUBSPEC" | sed 's/name:[ ]*//')
VERSION=$(grep "^version:" "$PUBSPEC" | sed 's/version:[ ]*//' | cut -d '+' -f1)
DESCRIPTION=$(grep "^description:" "$PUBSPEC" | sed 's/description:[ ]*//')

ARCH="amd64"
OUT_DIR="deb_output"
INSTALL_PREFIX="usr/share/$APP_NAME"

rm -rf "$OUT_DIR"
mkdir -p "$OUT_DIR/DEBIAN"
mkdir -p "$OUT_DIR/$INSTALL_PREFIX"

cp -r "build/linux/x64/release/bundle/"* "$OUT_DIR/$INSTALL_PREFIX/"
cp "app.png" "$OUT_DIR/$INSTALL_PREFIX/"

cat > "$OUT_DIR/DEBIAN/control" <<EOF
Package: $APP_NAME
Version: $VERSION
Architecture: $ARCH
Depends: libgtk-3-0, libasound2, libmpv1
Maintainer: Tachibana Shin <tachibshin@duck.com>
Description: $DESCRIPTION
EOF

chmod +x "$OUT_DIR/$INSTALL_PREFIX/$APP_NAME" || true

mkdir -p "$OUT_DIR/usr/share/applications"
cat > "$OUT_DIR/usr/share/applications/${APP_NAME}.desktop" <<EOF
[Desktop Entry]
Name=$APP_NAME
Exec=/usr/share/$APP_NAME/$APP_NAME
Icon=/usr/share/$APP_NAME/app.png
Type=Application
Categories=Utility;
EOF

dpkg-deb --build "$OUT_DIR" "app-linux-${ARCH}-release.deb"
