@REM	Build script to compile Netcat on WIN32 using MinGW
@REM
@REM	Rodney Beede	(http://www.rodneybeede.com)
@REM
@REM	2009-09-02
@REM
@REM	Tested with gcc 3.4.5 and MinGW version 5.1.4

SET COMPILER=c:\MinGW\bin\gcc.exe
SET LIB_DIR=c:\MinGW\lib

@REM	not needed? SET COMPILE_OPTIONS=-c -DWIN32 -DNDEBUG -D_CONSOLE -DTELNET
SET COMPILE_OPTIONS=-c

del *.o
del nc.exe

"%COMPILER%" %COMPILE_OPTIONS% getopt.c

"%COMPILER%" %COMPILE_OPTIONS% doexec.c

"%COMPILER%" %COMPILE_OPTIONS% netcat.c

@REM Note that the -l libraries MUST come at the very end or linking will fail
"%COMPILER%" getopt.o doexec.o netcat.o --output nc.exe -Wl,-L"%LIB_DIR%",-lkernel32,-luser32,-lwinmm,-lws2_32