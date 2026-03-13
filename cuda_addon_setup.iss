; cuda_addon_setup.iss
; GPU Addon installer for LibTorch CUDA DLLs
;
; Usage:
;   cuda_addon_setup.exe /SILENT /DIR="C:\path\to\app"
;
; Built by GitHub Actions, signed by TeamCity before distribution.

#define AppName    "LibTorch GPU Addon"
#ifndef AppVersion
#define AppVersion "dev"
#endif
#define Publisher  "a7brusco"

#define Configuration GetStringParam("Configuration", "release")
#define DllDir "dlls_" + Configuration

[Setup]
AppName={#AppName}
AppVersion={#AppVersion}
AppPublisher={#Publisher}
DefaultDirName={autopf}\{#AppName}
DisableDirPage=no
DisableProgramGroupPage=yes
OutputBaseFilename=cuda_addon_setup_{#Configuration}
Compression=lzma2/ultra64
SolidCompression=yes
PrivilegesRequired=admin
CreateUninstallRegKey=no
Uninstallable=no

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
; All GPU DLLs — packed and compressed by Inno Setup
Source: "{#DllDir}\*.dll"; DestDir: "{param:DIR|{app}}"; Flags: ignoreversion
