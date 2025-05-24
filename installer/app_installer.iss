; Inno Setup Script Hoyomi
[Setup]
AppName=Hoyomi
AppVersion=0.3.36.74
DefaultDirName={pf}\Hoyomi
DefaultGroupName=Hoyomi
OutputDir=installer\output
OutputBaseFilename=app-windows-x64-release
Compression=lzma
SolidCompression=yes

[Files]
Source: "..\build\windows\x64\runner\Release\*"; DestDir: "{app}"; Flags: recursesubdirs

[Icons]
Name: "{group}\Hoyomi"; Filename: "{app}\hoyomi.exe"
