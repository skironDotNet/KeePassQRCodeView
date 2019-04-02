@echo off

set plugin=%cd%\plugin
set source=%plugin%\source
					 
echo Copying source files to plugin\source for clean plugin compilation:
if not exist %source% mkdir %source%
copy /Y *.cs %source%
copy /Y *.csproj %source%
copy /Y *.resx %source% 
xcopy /S /Y %cd%\Resources %source%\Resources\  
xcopy /S /Y %cd%\Properties %source%\Properties\ 
del %plugin%\*.plgx >NUL
	  
echo Compiling plugin...
"c:\Program Files (x86)\KeePass Password Safe 2\KeePass.exe" --plgx-create %source% -plgx-prereq-kp:2.41 --plgx-prereq-net:4.0
		
echo Renaming...
ren %source%.plgx KeePassQRCodeView.plgx	
echo.
echo Clean compiled plugin is located in %cd%\plugin