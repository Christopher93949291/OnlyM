; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define Dependency_NoExampleSetup
#include "CodeDependencies.iss"

#define MyAppName "OnlyM"
#define MyAppPublisher "Antony Corbett"
#define MyAppURL "https://soundboxsoftware.com"
#define MyAppExeName "OnlyM.exe"
#define SlideManagerAppExeName "OnlyMSlideManager.exe"
#define SlideManagerAppName "OnlyM Slide Manager"

#define MyAppVersion GetFileVersion('..\OnlyM\bin\Release\net5.0-windows\publish\OnlyM.exe');

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{35121334-5755-4473-8091-217336532D16}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={commonpf}\OnlyM
DefaultGroupName={#MyAppName}
OutputDir="..\Installer\Output"
OutputBaseFilename=OnlyMSetup
SetupIconFile=..\Images\icon3.ico
Compression=lzma
SolidCompression=yes
AppContact=antony@corbetts.org.uk
DisableWelcomePage=false
SetupLogging=True
RestartApplications=False
CloseApplications=False
AppMutex=OnlyMMeetingMedia,OnlyMSlideManagerTool

PrivilegesRequired=admin


[InstallDelete]
; remove legacy shortcuts (wrongly named SlideManagerAppExeName instead of SlideManagerAppName)
Type: files; Name: "{group}\{#SlideManagerAppExeName}.lnk"
Type: files; Name: "{commondesktop}\{#SlideManagerAppExeName}.lnk"

; files from pre-net-5 edition
Type: filesandordirs; Name: "{app}\swiftshader"
Type: filesandordirs; Name: "{app}\locales"
Type: filesandordirs; Name: "{app}\FFmpeg"
Type: filesandordirs; Name: "{app}\x64"
Type: filesandordirs; Name: "{app}\x86"
Type: files; Name: "{app}\AutoMapper.dll"
Type: files; Name: "{app}\cef.pak"
Type: files; Name: "{app}\cef_100_percent.pak"
Type: files; Name: "{app}\cef_200_percent.pak"
Type: files; Name: "{app}\CommonServiceLocator.dll"
Type: files; Name: "{app}\d3dcompiler_47.dll"
Type: files; Name: "{app}\devtools_resources.pak"
Type: files; Name: "{app}\ffme.common.dll"
Type: files; Name: "{app}\GalaSoft.MvvmLight.dll"
Type: files; Name: "{app}\GalaSoft.MvvmLight.Extras.dll"
Type: files; Name: "{app}\GalaSoft.MvvmLight.Platform.dll"
Type: files; Name: "{app}\ImageProcessor.dll"
Type: files; Name: "{app}\Microsoft.WindowsAPICodePack.ShellExtensions.dll"
Type: files; Name: "{app}\natives_blob.bin"
Type: files; Name: "{app}\OnlyM.exe.config"
Type: files; Name: "{app}\OnlyMSlideManager.exe.config"
Type: files; Name: "{app}\Serilog.Sinks.Console.dll"
Type: files; Name: "{app}\Serilog.Sinks.RollingFile.dll"
Type: files; Name: "{app}\System.ValueTuple.dll"
Type: files; Name: "{app}\System.Windows.Interactivity.dll"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"

[Files]
Source: "..\OnlyM\bin\Release\net5.0-windows\publish\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs

// https://go.microsoft.com/fwlink/?linkid=2135256
Source: "netcorecheck.exe"; Flags: dontcopy noencryption

; web shortcuts...
Source: "..\UrlLinkFiles\JW Broadcasting.url"; DestDir: "{commonappdata}\OnlyM\Websites"
Source: "..\UrlLinkFiles\JW.org website.url"; DestDir: "{commonappdata}\OnlyM\Websites"
Source: "..\UrlLinkFiles\Watchtower online library.url"; DestDir: "{commonappdata}\OnlyM\Websites"

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{#SlideManagerAppName}"; Filename: "{app}\{#SlideManagerAppExeName}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon
Name: "{commondesktop}\{#SlideManagerAppName}"; Filename: "{app}\{#SlideManagerAppExeName}"; Tasks: desktopicon

[ThirdParty]
UseRelativePaths=True

[Code]
procedure InitializeWizard;
begin
  Dependency_InitializeWizard;
end;

function PrepareToInstall(var NeedsRestart: Boolean): String;
begin
  Result := Dependency_PrepareToInstall(NeedsRestart);
end;

function NeedRestart: Boolean;
begin
  Result := Dependency_NeedRestart;
end;

function UpdateReadyMemo(const Space, NewLine, MemoUserInfoInfo, MemoDirInfo, MemoTypeInfo, MemoComponentsInfo, MemoGroupInfo, MemoTasksInfo: String): String;
begin
  Result := Dependency_UpdateReadyMemo(Space, NewLine, MemoUserInfoInfo, MemoDirInfo, MemoTypeInfo, MemoComponentsInfo, MemoGroupInfo, MemoTasksInfo);
end;

function InitializeSetup: Boolean;
begin
  // add dependencies (.NET 5 x86 desktop runtime)  
  Dependency_ForceX86 := true;  
  Dependency_AddDotNet50Desktop;    
  
  Result := True;  
end;


