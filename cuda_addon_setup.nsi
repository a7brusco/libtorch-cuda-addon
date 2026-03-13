; cuda_addon_setup.nsi
; GPU Addon installer for LibTorch CUDA DLLs
;
; Usage:
;   cuda_addon_setup.exe /DIR="C:\path\to\app"
;
; Built by GitHub Actions, signed by TeamCity before distribution.

;--------------------------------
; Defines (overridable via /D on command line)

!ifndef VERSION
  !define VERSION "dev"
!endif

!ifndef CONFIG
  !define CONFIG "release"
!endif

!define DLLDIR "dlls_${CONFIG}"

;--------------------------------
; General

Name "LibTorch GPU Addon ${VERSION}"
OutFile "Output\cuda_addon_setup_${CONFIG}.exe"
Unicode True
RequestExecutionLevel admin
SilentInstall silent

;--------------------------------
; Default install dir (overridden by /DIR= at runtime)

InstallDir "$PROGRAMFILES64\LibTorch GPU Addon"

;--------------------------------
; Pages (shown when /DIR= is not passed)

Page directory
Page instfiles

;--------------------------------
; Sections

Section "GPU DLLs" SEC_DLLS

  ; If /DIR= was passed on the command line, use it
  ${If} $INSTDIR == ""
    MessageBox MB_OK "No installation directory specified. Use /DIR= to specify the app directory."
    Abort
  ${EndIf}

  SetOutPath "$INSTDIR"

  File "${DLLDIR}\torch_cuda.dll"
  File "${DLLDIR}\cupti64_2025.3.0.dll"
  File "${DLLDIR}\c10_cuda.dll"
  File "${DLLDIR}\cublas64_13.dll"
  File "${DLLDIR}\cublasLt64_13.dll"
  File "${DLLDIR}\cudnn64_9.dll"
  File "${DLLDIR}\cufft64_12.dll"
  File "${DLLDIR}\cusolver64_12.dll"
  File "${DLLDIR}\cusparse64_12.dll"
  File "${DLLDIR}\nvJitLink_130_0.dll"

SectionEnd
