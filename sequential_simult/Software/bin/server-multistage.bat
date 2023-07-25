REM batch driver script for multistage server
REM $Id: server-multistage.bat 1539 2010-06-25 18:55:53Z wmyuan $

@echo off


set LIBDIR=..\lib
set BINDIR=..\bin
set CONFDIR=..\conf
set log4j.configuration=%CONFDIR%\log4j.properties


:checkJava
if "%JAVACMD%" == "" set JAVACMD=java
set LOCALCLASSPATH="%CLASSPATH%"
for %%i in ("%LIBDIR%\*.jar") do call "%BINDIR%\lcp.bat" "%%i"

:run
%JAVACMD% -classpath %LOCALCLASSPATH%;%CONFDIR%;. -Dprop.home=%CONFDIR% edu.caltechUcla.sselCassel.projects.multistage.server.StartServer
goto end


:end
set LOCALCLASSPATH=
set BINDIR=
set LIBDIR=

pause

