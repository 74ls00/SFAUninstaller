@echo off
chcp 866
rem for x64
rem Запускать из проводника!


taskkill /im SFAUpdater.exe /t /f
taskkill /im sfa.exe /t /f

rd /s /q "%ProgramFiles(x86)%\Smart File Advisor"
rd /s /q "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Smart File Advisor"

reg delete "HKLM\SOFTWARE\Microsoft\Shared Tools\MSConfig\startupreg\Smart File Advisor" /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run" /v SFAUpdater /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run" /v "Smart File Advisor" /f

reg delete HKCR\*\shell\!sfa /f
reg delete HKCR\*\shell\sfa_checksum /f
reg delete "HKCU\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Persisted" /v "C:\Program Files (x86)\Smart File Advisor\unins000.exe" /f

reg delete HKCR\Unknown\shell\openas\command /v sfa_backup /f
reg delete HKCR\Unknown\shell\openas\command /v sfa_backup_DelegateExecute /f

reg add HKCR\Unknown\shell\openas\command /ve /t REG_EXPAND_SZ /d "%%SystemRoot%%\system32\rundll32.exe %%SystemRoot%%\system32\shell32.dll,OpenAs_RunDLL %%1" /f
rem reg add HKCR\Unknown\shell\openas\command /ve /t REG_EXPAND_SZ /d ^%SystemRoot^%\system32\rundll32.exe" "^%SystemRoot^%\system32\shell32.dll,OpenAs_RunDLL" "%1 /f

reg add HKCR\Unknown\shell\openas\command /v DelegateExecute /t REG_SZ /d "{e44e9428-bdbc-4987-a099-40dc8fd255e7}" /f

reg delete HKCR\Unknown\shell\opendlg\command /v sfa_backup /f
reg add HKCR\Unknown\shell\opendlg\command /ve /t REG_EXPAND_SZ /d "%%SystemRoot%%\system32\rundll32.exe %%SystemRoot%%\system32\shell32.dll,OpenAs_RunDLL %%1" /f
rem reg add HKCR\Unknown\shell\opendlg\command /ve /t REG_EXPAND_SZ /d ^%SystemRoot^%\system32\rundll32.exe" "^%SystemRoot^%\system32\shell32.dll,OpenAs_RunDLL" "%1 /f

reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Smart File Advisor_is1" /f

reg delete "HKLM\SOFTWARE\Wow6432Node\Smart File Advisor" /f



rem HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall




pause

rem https://www.betaarchive.com/forum/viewtopic.php?t=32485
rem http://forum.ru-board.com/topic.cgi?forum=5&topic=21466&start=2117&limit=1&m=1
rem http://forum.ru-board.com/topic.cgi?forum=5&topic=21466&start=2220#17
rem Alcohol52_FE_2.0.3.10521\$TEMP\AxSFADownloader.exe
rem http://forum.oszone.net/showthread.php?p=2830265#post2830265
