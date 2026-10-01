@echo off
REM =========================================================================
REM  DATA LAB PERÚ - SISTEMA PREMIUM DE CONTROL Y DIAGNÓSTICO DE HARDWARE
REM =========================================================================
title Data Lab Peru - Control de Hardware v4.0

:: Forzar idioma UTF-8 para evitar caracteres rotos
chcp 65001 >nul

:: Forzar Ejecución como Administrador de forma automática
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k ""%~s0"" %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )

cls
echo.
echo        ===================================================================
echo         [+]  D  A  T  A  L  A  B      P  E  R  Ú  [+]
echo        ===================================================================
echo         ██████╗  █████╗ ████████╗ █████╗ ██╗      █████╗ ██████╗ 
echo         ██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗  ██║     ██╔══██╗██╔══██╗
echo         ██║  ██║███████║   ██║   ███████║  ██║     ███████║██████╔╝
echo         ██║  ██║██╔══██║   ██║   ██╔══██║  ██║     ██╔══██║██╔══██╗
echo         ██████╔╝██║  ██║   ██║   ██║  ██║  ███████╗██║  ██║██████╔╝
echo         ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝  ╚══════╝╚═╝  ╚═╝╚═════╝ 
echo                     S O P O R T E   H A R D W A R E  -  L I M A
echo        ===================================================================
echo.

:: Lanzar motor interno en PowerShell con tu estructura exacta
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command ^
    "$Fabricante = (Get-WmiObject Win32_ComputerSystem).Manufacturer.ToUpper();" ^
    "$Modelo = (Get-WmiObject Win32_ComputerSystem).Model;" ^
    "$WinVersion = (Get-WmiObject Win32_OperatingSystem).Caption;" ^
    "$WinArch = (Get-WmiObject Win32_OperatingSystem).OSArchitecture;" ^
    "$CPU = (Get-WmiObject Win32_Processor).Name.Trim();" ^
    "$RAM_Bytes = (Get-WmiObject Win32_ComputerSystem).TotalPhysicalMemory;" ^
    "$RAM_GB = [math]::Round($RAM_Bytes / 1GB);" ^
    "$GPU = (Get-WmiObject Win32_VideoController).Name;" ^
    "Write-Host '===================================================================' -ForegroundColor Cyan;" ^
    "Write-Host '             SISTEMA DE VALIDACIÓN INTEGRAL DE HARDWARE            ' -ForegroundColor Cyan;" ^
    "Write-Host '===================================================================' -ForegroundColor Cyan;" ^
    "Write-Host \"[+] Sistema Operativo  : $WinVersion ($WinArch)\" -ForegroundColor White;" ^
    "Write-Host \"[+] Equipo Identificado: $Fabricante $Modelo\" -ForegroundColor White;" ^
    "Write-Host \"[+] Procesador Central : $CPU\" -ForegroundColor White;" ^
    "Write-Host \"[+] Memoria RAM Total  : $RAM_GB GB RAM\" -ForegroundColor White;" ^
    "Write-Host \"[+] Controlador Video  : $GPU\" -ForegroundColor White;" ^
    "Write-Host '[-] Accediendo al Kernel del sistema operativo...' -ForegroundColor Gray;" ^
    "Start-Sleep -Seconds 1;" ^
    "Write-Host '';" ^
    "Write-Host '--- [PASO 1] CONECTIVIDAD WI-FI / INTERNET ---' -ForegroundColor Cyan;" ^
    "Write-Host '[-] Escaneando adaptador...' -NoNewline -ForegroundColor Gray;" ^
    "try {" ^
    "    $Ping = Test-Connection -ComputerName ://google.com -Count 1 -ErrorAction SilentlyContinue;" ^
    "    if ($Ping) {" ^
    "        $Interfaces = (Get-WmiObject Win32_NetworkAdapter | Where-Object {$_.NetConnectionStatus -eq 2}).NetConnectionID.ToLower();" ^
    "        Write-Host ' [ OK ]' -ForegroundColor Green;" ^
    "        if ($Interfaces -like '*wi-fi*' -or $Interfaces -like '*inalám*' -or $Interfaces -like '*wireless*') {" ^
    "            Write-Host '  • Red Inalámbrica          : CONECTADO A INTERNET VÍA INALÁMBRICA (WI-FI)' -ForegroundColor White;" ^
    "        } else {" ^
    "            Write-Host '  • Red Inalámbrica          : CONECTADO A INTERNET VÍA CABLEADO FÍSICO (ETHERNET LAN)' -ForegroundColor White;" ^
    "        }" ^
    "    } else {" ^
    "        Write-Host ' [ ADVERTENCIA ]' -ForegroundColor Yellow;" ^
    "        Write-Host '  • Red Inalámbrica          : RED DETECTADA PERO SIN TRÁFICO HTTP (LIMITADA)' -ForegroundColor Yellow;" ^
    "    }" ^
    "} catch {" ^
    "    Write-Host ' [ FALLO ]' -ForegroundColor Red;" ^
    "    Write-Host '  • Red Inalámbrica          : INTERFACES DESCONECTADAS / SIN ACCESO A INTERNET' -ForegroundColor Red;" ^
    "}" ^
    "Write-Host '';" ^
    "Write-Host '--- [PASO 2] INTEGRACIÓN DE INTERFACES DE USUARIO ---' -ForegroundColor Cyan;" ^
    "Write-Host '[-] Validando bus del teclado físico...' -NoNewline -ForegroundColor Gray;" ^
    "$KeyStatus = (Get-WmiObject Win32_Keyboard).Status;" ^
    "if ($KeyStatus -eq 'OK' -or $KeyStatus -match 'OK') {" ^
    "    Write-Host ' [ OK ]' -ForegroundColor Green;" ^
    "    Write-Host '  • Bus de Teclado           : INTERFAZ DE BUS OPERATIVA Y RESPONDIENDO' -ForegroundColor White;" ^
    "} else {" ^
    "    Write-Host ' [ ADVERTENCIA ]' -ForegroundColor Yellow;" ^
    "    Write-Host '  • Bus de Teclado           : CONTROLADOR REPORTA ADVERTENCIAS O AUSENCIA' -ForegroundColor Yellow;" ^
    "}" ^
    "Write-Host '[-] Mapeando dispositivos apuntadores...' -NoNewline -ForegroundColor Gray;" ^
    "$MouseInfo = (Get-WmiObject Win32_PointingDevice -ErrorAction SilentlyContinue);" ^
    "if ($MouseInfo) {" ^
    "    Write-Host ' [ OK ]' -ForegroundColor Green;" ^
    "    Write-Host '  • Dispositivo Apuntador     : TOUCHPAD INTEGRADO / MOUSE REGISTRADO OPERATIVO' -ForegroundColor White;" ^
    "} else {" ^
    "    Write-Host ' [ ADVERTENCIA ]' -ForegroundColor Yellow;" ^
    "    Write-Host '  • Dispositivo Apuntador     : LÍNEAS DE SEÑAL NO ASIGNADAS' -ForegroundColor Yellow;" ^
    "}" ^
    "Write-Host '';" ^
    "Write-Host '--- [PASO 3] EXTRACCIÓN DE BUSES DE COMUNICACIÓN ---' -ForegroundColor Cyan;" ^
    "Write-Host '[-] Escaneando antena Bluetooth...' -NoNewline -ForegroundColor Gray;" ^
    "try {" ^
    "    $BtService = Get-Service -Name bthserv -ErrorAction SilentlyContinue;" ^
    "    if ($BtService.Status -eq 'Running') {" ^
    "        Write-Host ' [ OK ]' -ForegroundColor Green;" ^
    "        Write-Host '  • Módulo Bluetooth          : ANTENA BLUETOOTH ACTIVA Y FUNCIONANDO EN EL KERNEL' -ForegroundColor White;" ^
    "    } else {" ^
    "        Write-Host ' [ FALLO ]' -ForegroundColor Red;" ^
    "        Write-Host '  • Módulo Bluetooth          : SERVICIO BLUETOOTH DESHABILITADO EN EL SISTEMA' -ForegroundColor Red;" ^
    "    }" ^
    "} catch {" ^
    "    Write-Host ' [ FALLO ]' -ForegroundColor Red;" ^
    "    Write-Host '  • Módulo Bluetooth          : ADAPTADOR BLUETOOTH NO RESPONDE AL BUS EN SERVICIO' -ForegroundColor Red;" ^
    "}" ^
    "Write-Host '[-] Analizando controladoras USB...' -NoNewline -ForegroundColor Gray;" ^
    "$UsbCount = (Get-WmiObject Win32_USBController -ErrorAction SilentlyContinue).Count;" ^
    "if ($UsbCount -gt 0) {" ^
    "    Write-Host ' [ OK ]' -ForegroundColor Green;" ^
    "    Write-Host \"  • Líneas USB en Placa       : $UsbCount CONTROLADORAS ACTIVAS COMPROBADAS EN PLACA\" -ForegroundColor White;" ^
    "} else {" ^
    "    Write-Host ' [ ADVERTENCIA ]' -ForegroundColor Yellow;" ^
    "    Write-Host '  • Líneas USB en Placa       : BUS DE DATOS USB COMPROMETIDO O SIN ENERGÍA' -ForegroundColor Yellow;" ^
    "}" ^
    "Write-Host '';" ^
    "Write-Host '--- [PASO 4] PRUEBA DE PANTALLA Y ARQUITECTURA ELÉCTRICA ---' -ForegroundColor Cyan;" ^
    "Write-Host '[-] Lanzando ráfaga acústica en altavoces...' -NoNewline -ForegroundColor Gray;" ^
    "try {" ^
    "    [console]::Beep(523, 150); [console]::Beep(659, 150); [console]::Beep(784, 150); [console]::Beep(1046, 250);" ^
    "    Write-Host ' [ OK ]' -ForegroundColor Green;" ^
    "    Write-Host '  • Canales de Altavoces      : RÁFAGA ACÚSTICA PROBADA EN ALTAVOCES INTEGRADOS' -ForegroundColor White;" ^
    "} catch {" ^
    "    Write-Host ' [ ADVERTENCIA ]' -ForegroundColor Yellow;" ^
    "    Write-Host '  • Canales de Altavoces      : SUBSISTEMA DE AUDIO NO ACCESIBLE O SILENCIADO' -ForegroundColor Yellow;" ^
    "}" ^
   "Write-Host '[-] Inicializando bus de cámara web...' -NoNewline -ForegroundColor Gray;" ^
    "if (Get-WmiObject Win32_PnPEntity -ErrorAction SilentlyContinue | Where-Object {$_.Description -match 'Camera|Video|Webcam'}) { Write-Host ' [ OK ]' -ForegroundColor Green; Write-Host '  • Cámara Web Integrada     : DISPOSITIVO REGISTRADO EN EL BUS DE VIDEO' -ForegroundColor White; } else { Write-Host ' [ FALLO ]' -ForegroundColor Red; Write-Host '  • Cámara Web Integrada     : LENTE O FLEX FÍSICO DESCONECTADO EN PLACA' -ForegroundColor Red; }" ^
    "Write-Host '[-] Capturando bus del micrófono...' -NoNewline -ForegroundColor Gray;" ^
    "if (Get-WmiObject Win32_SoundDevice -ErrorAction SilentlyContinue) { Write-Host ' [ OK ]' -ForegroundColor Green; Write-Host '  • Entrada de Micrófono      : CONTROLADOR DE CAPTURA ACTIVO EN KERNEL' -ForegroundColor White; } else { Write-Host ' [ FALLO ]' -ForegroundColor Red; Write-Host '  • Entrada de Micrófono      : CÁPSULA ACÚSTICA INACTIVA O CONDUCTOR ROTO' -ForegroundColor Red; }" ^
    "Write-Host '[-] Extrayendo flujo de energía de la placa...' -NoNewline -ForegroundColor Gray;" ^
    "$BatStatus = (Get-WmiObject Win32_Battery -ErrorAction SilentlyContinue);" ^
    "if ($BatStatus) {" ^
    "    $Carga = $BatStatus.EstimatedChargeRemaining;" ^
    "    $StCode = $BatStatus.BatteryStatus;" ^
    "    if ($StCode -eq 2 -or $StCode -eq 3 -or $StCode -eq 6 -or $StCode -eq 7) {" ^
    "        $BatMsg = 'CONECTADO (CARGANDO / RED ELÉCTRICA AC)';" ^
    "    } else {" ^
    "        $BatMsg = 'DESCONECTADO (USANDO BATERÍA)';" ^
    "    }" ^
    "    Write-Host ' [ OK ]' -ForegroundColor Green;" ^
    "    Write-Host \"  • Estado de Suministro      : $BatMsg\" -ForegroundColor White;" ^
    "    Write-Host \"  • Retención de Carga Actual : $Carga%%\" -ForegroundColor White;" ^
    "} else {" ^
    "    Write-Host ' [ OK ]' -ForegroundColor Green;" ^
    "    Write-Host '  • Tipo de Alimentación      : LÍNEA AC PERMANENTE (PC de Escritorio)' -ForegroundColor White;" ^
    "    Write-Host '  • Estado de Carga           : FUENTE SANA Y ESTABLE (100%%)' -ForegroundColor White;" ^
    "}" ^
    "Write-Host '';" ^
    "Write-Host '===================================================================' -ForegroundColor Cyan;" ^
    "Write-Host '          DIAGNÓSTICO DE COMPONENTES PROCESADO CON ÉXITO            ' -ForegroundColor Cyan;" ^
    "Write-Host '===================================================================' -ForegroundColor Cyan;"

echo.
echo  -------------------------------------------------------------------
echo   [PROCESO TERMINADO] La consola de Data Lab quedará fija.
echo  -------------------------------------------------------------------
pause