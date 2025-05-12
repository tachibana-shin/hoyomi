if [[ "$1" == "--exit" ]]; then
  dart run scripts/format.dart --exit
else
  dart run scripts/format.dart
fi