@set /P x=Do you want to set DEVPACK = "%~dp0" ? (y/n)?
@set x=%x:~0,1%
@if (%x%)==(y) call setx DEVPACK %~dp0
@pause
