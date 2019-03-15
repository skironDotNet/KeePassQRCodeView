@echo off

set plugin=%cd%\plugin
set source=%plugin%\source
					 
echo coping source files to plugin\source for clean plugin
if not exist %source% mkdir %source%
cp *.cs %source%
cp *.csproj %source%
cp *.resx %source% 
xcopy /S /Y %cd%\Resources %source%\Resources\  >NUL
xcopy /S /Y %cd%\Properties %source%\Properties\ >NUL
del %plugin%\*.plgx
	  
echo compiling plugin
"c:\Program Files (x86)\KeePass Password Safe 2\KeePass.exe" --plgx-create %source% -plgx-prereq-kp:2.41 --plgx-prereq-net:4.0
		
echo renaming
ren %source%.plgx KeePassQRCodeView.plgx		
echo Clean compiled plugin is located in %cd%\plugin