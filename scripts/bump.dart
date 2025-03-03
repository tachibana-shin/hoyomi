// ignore_for_file: avoid_print

import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:prompts/prompts.dart' as prompts;

Future<void> bumpFlutter() async {
  final pubspecPath = path.normalize("pubspec.yaml");
  final pubspecFile = File(pubspecPath);

  if (!await pubspecFile.exists()) {
    print("Error: pubspec.yaml not found");
    exit(1);
  }

  final content = await pubspecFile.readAsString();
  final versionMatch = RegExp(r'version:\s*(.+)').firstMatch(content);

  if (versionMatch == null) {
    print("Error: Version not found in pubspec.yaml");
    exit(1);
  }

  final currentVersion = versionMatch.group(1)!;
  final parts = currentVersion.split("+");
  final versionParts = parts[0].split(".").map(int.parse).toList();
  final buildNumber = int.parse(parts[1]);

  print("Current version: ${versionParts.join('.')}+$buildNumber");

  final versionOptions = {
    "next": [versionParts[0], versionParts[1], versionParts[2] + 1],
    "major": [versionParts[0] + 1, 0, 0],
    "minor": [versionParts[0], versionParts[1] + 1, 0],
    "patch": [versionParts[0], versionParts[1], versionParts[2] + 1]
  };

  final versionChoices = versionOptions.keys.map((key) {
    final newVersion = versionOptions[key]!;
    return "$key → ${newVersion.join('.')}+${buildNumber + 1}";
  }).toList()
    ..add("custom → Enter manually");

  final versionChoice =
      prompts.choose("Select version update type:", versionChoices) ?? "next";
  String selectedKey = versionOptions.keys.firstWhere(
      (key) => versionChoice.startsWith(key),
      orElse: () => "custom");

  if (selectedKey == "custom") {
    final customVersion =
        prompts.get("Enter new version", defaultsTo: parts[0]);
    versionParts.setAll(0, customVersion.split(".").map(int.parse));
  } else {
    versionParts.setAll(0, versionOptions[selectedKey]!);
  }

  final newBuildNumber = buildNumber + 1;
  final newVersionString = "${versionParts.join('.')}+$newBuildNumber";

  final updatedContent = content.replaceAll(
      RegExp(r'version:\s*\d+\.\d+\.\d+\+\d+'), 'version: $newVersionString');

  await pubspecFile.writeAsString(updatedContent);

  Process.runSync("git", ["add", pubspecPath]);
  Process.runSync("git", ["commit", "-m", "chore: release $newVersionString"]);
  Process.runSync("git", ["tag", "v$newVersionString"]);
  Process.runSync("git", ["push"]);
  Process.runSync("git", ["push", "--tags"]);

  print("✅ Version updated successfully: $newVersionString");
}

void main() {
  bumpFlutter();
}
