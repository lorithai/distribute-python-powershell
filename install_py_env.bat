@echo off

REM don't close cmd on error. 
REM Does this by checking if variable in_subprocess is defined. If not, create a new cmd (/k prevents it from closing) 
REM ^& becomes & (and) while %0 is the path of the currently running bash script and %* are all input paramters. 
REM Basically, it opens a new cmd and invokes the bash script again. 
REM Finally exit the inital bash script. 
if not defined in_subprocess (cmd /k set in_subprocess=y ^& %0 %*) & exit )

REM "-ExecutionPolicy Bypass" tries to surpress standard powershell restriction
powershell -ExecutionPolicy Bypass ".\src\install_py_env.ps1 DefaultInstall"
