{pkgs}: {
  channel = "stable-24.05";
  packages = [
    pkgs.jdk19
    pkgs.unzip
  ];
  idx.extensions = [
    pkgs.gh
    "Codium.codium"
    "Dart-Code.dart-code"
    "Dart-Code.flutter"
    "denoland.vscode-deno"
    "golang.go"
    "Nash.awesome-flutter-snippets"
    "RodrigoRahman.flutter-dart-utils"
  ];
  idx.previews = {
    previews = {
      web = {
        command = [
          "flutter"
          "run"
          "--machine"
          "-d"
          "web-server"
          "--web-hostname"
          "0.0.0.0"
          "--web-port"
          "$PORT"
        ];
        manager = "flutter";
      };
      android = {
        command = [
          "flutter"
          "run"
          "--machine"
          "-d"
          "android"
          "-d"
          "localhost:5555"
        ];
        manager = "flutter";
      };
    };
  };
}