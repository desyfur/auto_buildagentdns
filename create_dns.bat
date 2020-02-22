@echo off
SETlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
SET ThisScriptsDirectory=%~dp0
SET PowerShellScriptPath=%ThisScriptsDirectory%dns.ps1

Set buildip=
Set zonename=
set zonename2=

Set /p projname=Enter the project name: 
echo %projname%| findstr /r "^[a-z]*$">nul && (
    echo %projname% is valid.
) || (
    echo %projname% is NOT valid. Must be only alphabetical characters. Numbers and symbols are NOT allowed.
    PAUSE
    EXIT
)

CALL :LoCase projname
Set projname
:LoCase
FOR %%i IN ("A=a" "B=b" "C=c" "D=d" "E=e" "F=f" "G=g" "H=h" "I=i" "J=j" "K=k" "L=l" "M=m" "N=n" "O=o" "P=p" "Q=q" "R=r" "S=s" "T=t" "U=u" "V=v" "W=w" "X=x" "Y=y" "Z=z") DO CALL SET "%1=%%%1:%%~i%%"

set /p buildagents=Enter the number of build agents: 
echo %buildagents%| findstr /r "^[1-5]$">nul && (
    echo %buildagents% is a valid number.
) || (
    echo %buildagents% is NOT a valid number. Must be a number from 0 to 5.
    PAUSE
    EXIT
)

for /L %%n in (1,1,%buildagents%) do  (
    set /p buildagentip%%n=Enter the IP for the #%%n build agent:
    echo !buildagentip%%n!| findstr /r "[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*" >nul && (
        echo !buildagentip%%n! is a valid IP address.
    ) || (
        echo !buildagentip%%n! is NOT a valid IP address. Please run the script again.
        PAUSE
        EXIT
    )
)

PowerShell -NoProfile -ExecutionPolicy Bypass -file "%PowerShellScriptPath%" "%projname%" "%buildip%" "%zonename%" "%zonename2%" "%buildagents%" "%buildagentip1%" "%buildagentip2%" "%buildagentip3%" "%buildagentip4%" "%buildagentip5%"

PAUSE
EXIT