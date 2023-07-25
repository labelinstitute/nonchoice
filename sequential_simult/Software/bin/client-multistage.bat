@echo off

echo -------------------------------------------------------------------------
echo Please Wait, Software Initializing........
echo Note: Please do not close this window.
echo -------------------------------------------------------------------------

set LIBDIR=..\lib
set BINDIR=..\bin
set CONFDIR=..\conf
set PROPFILE=%CONFDIR%\clientlog.properties

:checkJava
if "%JAVACMD%" == "" set JAVACMD=java

set LOCALCLASSPATH="%CLASSPATH%"
for %%i in ("%LIBDIR%\*.jar") do call "%BINDIR%\lcp.bat" "%%i"


:run
%JAVACMD% -classpath %LOCALCLASSPATH%;%CONFDIR%;. -Dlog4j.configuration=%PROPFILE% edu.caltechUcla.sselCassel.projects.multistage.client.StartClient
goto end

:end
set LOCALCLASSPATH=
set BINDIR=
set LIBDIR=
set PROFILE=

REM batch driver script for multistage client
REM $Id: client-multistage.bat 1539 2010-06-25 18:55:53Z wmyuan $

