@echo off
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
set "fullstamp=%YYYY%%MM%%DD%-%HH%%Min%%Sec%"

echo fullstamp: "%fullstamp%"
echo "%USERPROFILE%\Desktop\%fullstamp%-putty.reg"

regedit /e "%onedrive%\Desktop\%fullstamp%-putty.reg" HKEY_CURRENT_USER\Software\SimonTatham > Nul
if  %errorlevel% neq 0 (
	echo oops! something went wrong, not sure what though! :\
) else (
	echo Putty settings have been exported to : "%USERPROFILE%\Desktop\%fullstamp%-putty.reg"
)
pause
