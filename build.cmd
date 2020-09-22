xcopy /s /i /y ".\AxImp.exe" "D:\a\icsmanager\bin\"
rm ".\AxImp.exe"
@echo off

for /D %%d in (%SystemRoot%\Microsoft.NET\Framework\v4*) do set "msbuild=%%d\MSBuild.exe"
if not exist "%msbuild%" (
	echo .NET Framework v4.0 is required to build this program
	pause
	goto :EOF
)

@echo on
%msbuild% /p:Configuration=Release;DebugType=None;OutDir=..\;ToolPath=D:\a\icsmanager\bin\
