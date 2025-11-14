wsusutil.exe postinstall SQL_INSTANCE_NAME="USRNOPSCCMDA01.MYIGT.COM" CONTENT_DIR=D:\WSUS

wsusutil.exe postinstall /servicing
wsusutil.exe reset

cd c:\"Program Files"\"Update Services"\Tools
wsusutil.exe configuressl USRNOPSCCM02 - HIT ENTER
