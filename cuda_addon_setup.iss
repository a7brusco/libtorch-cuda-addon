; cuda_addon_setup.iss
; GPU Addon installer for LibTorch CUDA DLLs
;
; Usage:
;   cuda_addon_setup.exe /SILENT /DIR="C:\path\to\app"
;
; Built by GitHub Actions, signed by TeamCity before distribution.

#ifndef AppVersion
#define AppVersion "dev"
#endif

#ifndef Configuration
#define Configuration "release"
#endif

#define DllDir "dlls_" + Configuration

#pragma message "DllDir = " + DllDir
#pragma message "Configuration = " + Configuration

[Setup]
AppName=LibTorch GPU Addon
AppVersion={#AppVersion}
AppPublisher=a7brusco
DefaultDirName={autopf}\LibTorch GPU Addon
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
