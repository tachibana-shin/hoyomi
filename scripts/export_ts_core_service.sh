#!/bin/bash

TARGET_DIR="lib/core_services"
OUTPUT_FILE="$TARGET_DIR/main.ts"

rm -f "$OUTPUT_FILE"

find "$TARGET_DIR" -type f -name "*.ts" ! -name "main.ts" | while read filepath; do
  relpath="${filepath#$TARGET_DIR/}"
  relpath="${relpath%.ts}"

  relpath="${relpath//'\'/"/"}"

  echo "export * from \"./$relpath\"" >> "$OUTPUT_FILE"
done

echo "OK: Exported core services to $OUTPUT_FILE"
