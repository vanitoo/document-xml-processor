@echo off
SETLOCAL

echo ?? Очистка временных файлов .NET проектов...

REM Удаление bin и obj во всех подпапках
FOR /D /R %%d IN (bin,obj,objd,TestResults) DO (
    IF EXIST "%%d" (
        echo ”даление: %%d
        rmdir /s /q "%%d"
    )
)

REM Удаление .vs (Visual Studio)
IF EXIST ".vs" (
    echo Удаление: .vs
    rmdir /s /q ".vs"
)

REM Удаление скрытых кэшей и логов
FOR %%f IN (*.user *.suo *.log *.tmp) DO (
    del /f /q %%f 2>nul
)

echo ? Очистка завершена.
ENDLOCAL
pause
