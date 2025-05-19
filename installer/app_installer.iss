; Inno Setup Script Example
[Setup]
AppName=Hoyomi
AppVersion=1.0.0
DefaultDirName={pf}\Hoyomi
DefaultGroupName=Hoyomi
OutputDir=installer\output
OutputBaseFilename=HoyomiInstaller
Compression=lzma
SolidCompression=yes

[Files]
Source: "build\windows\runner\Release\*"; DestDir: "{app}"; Flags: recursesubdirs

[Icons]
Name: "{group}\Hoyomi"; Filename: "{app}\app.png"
