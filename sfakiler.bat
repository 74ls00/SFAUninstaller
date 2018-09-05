@echo off

rem for x64


rem echo taskkill SFAUpdater.exe sfa.exe
taskkill /im SFAUpdater.exe /t /f
taskkill /im sfa.exe /t /f
rem echo Удаление из %ProgramFiles(x86)% 
rd /s /q "%ProgramFiles(x86)%\Smart File Advisor"
rem echo Удаление из меню пуск
rd /s /q "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Smart File Advisor"

reg delete HKCR\*\shell\!sfa /f
reg delete HKCR\*\shell\sfa_checksum /f
reg delete "HKCU\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Persisted" /v "C:\Program Files (x86)\Smart File Advisor\unins000.exe" /f

reg delete "HKLM\SOFTWARE\Microsoft\Shared Tools\MSConfig\startupreg\Smart File Advisor" /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run" /v SFAUpdater /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run" /v "Smart File Advisor" /f


pause

rem https://www.betaarchive.com/forum/viewtopic.php?t=32485
rem http://forum.ru-board.com/topic.cgi?forum=5&topic=21466&start=2117&limit=1&m=1
rem
rem Alcohol52_FE_2.0.3.10521\$TEMP\AxSFADownloader.exe