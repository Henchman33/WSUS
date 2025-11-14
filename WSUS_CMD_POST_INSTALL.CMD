wsusutil.exe postinstall SQL_INSTANCE_NAME="XXXXXX.XXXX.COM" CONTENT_DIR=D:\WSUS

wsusutil.exe postinstall /servicing
wsusutil.exe reset

cd c:\"Program Files"\"Update Services"\Tools
wsusutil.exe configuressl xxxxxxSERVER - HIT ENTER
