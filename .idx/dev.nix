{pkgs}: {
  channel = "stable-24.05";
  packages = [
    pkgs.jdk19
    pkgs.unzip
    pkgs.cmake
    pkgs.ninja
    pkgs.gtk3
    pkgs.clang
    pkgs.rustup
    pkgs.pkg-config
    pkgs.gcc
    pkgs.gtk3  # GTK for Flutter desktop
    pkgs.gtk3-x11  # Some distros require this explicitly
    pkgs.libepoxy  # (GTK dependency)
    pkgs.at-spi2-core  # Accessibility bridge lib needed in some builds
    pkgs.xorg.libX11
    pkgs.gtk-sharp-3_0
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