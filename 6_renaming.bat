set a=0
setlocal EnableDelayedExpansion
FOR /f "tokens=*" %%i IN ('dir /a:d /b') DO (
set /A a+=1
ren "%%i" "case!a!"
)