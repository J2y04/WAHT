��
cls
@echo off
title Windows Account Hacking Tool^(WAHT^) - Made by J2y04

echo.
set /p login="Password: " 
:admin
echo [+] Checking if User is admin...
timeout /t 1 >nul
net session
if %errorlevel% GTR 0 (
   echo Current User is not Admin, please run as Admin.
   echo Quitting...
   timeout /t 2 >nul
   exit
)
if %login% EQU onepiece goto menu
if %login% EQU jayadmin04 goto menu
if %login% NEQ onepiece goto failed

:failed
echo Wrong Password. Qutting......
timeout /t 2  >nul
exit

:menu
cls
echo ***************************************
echo # Windows Account Hacking Tool^(WAHT^)   #
echo # DEV: J2y04                           #
echo # Credits: https://github.com/J2y04    #
echo ***************************************
echo.

echo list - List existing user Accounts
echo hack - Hack a User Account
echo create - Create a new User
echo delete - Delete a User Account
echo exit - Exit WAHT
echo enable - Activate a User Account
echo disable - Disable a User Account
echo.
echo.
set /p ans="> "
if %ans% EQU exit (
   exit
)
if %ans% EQU list (
   net user
   pause
   cls
   goto :menu
)
if %ans% EQU delete (
   net user
   echo.
   set /p user1="User-Account to delete: "  
   echo Are you sure you want to delete %user1%?
   echo Press Enter if so
   pause >nul
   net user %user1% /DELETE
   pause
   cls
   goto menu
)

if %ans% EQU create (
   set /p user2="Select Username: "
   set /p pass1="Select Password: "
echo.
echo Do you want to create User: %user2% with Password %pass1%?
echo Press Enter if so
pause >nul
net user %user2% %pass1% /ADD
pause
cls
goto menu
)

if %ans% EQU hack (
    net user
    echo.
    set /p user3="Enter Username: "
    set /p pass2="Enter new Password for %user3%: "
    echo Are you sure you want to hack %user3%
    echo Press Enter if so
    pause >nul
    net user  %user3% %pass2%
    pause
    cls
    goto menu 
)
if %ans% EQU enable (
   net user
   echo.
   set /p acc="User Account to enable: "
   net user %acc% /ACTIVATE:YES
)

if %ans% EQU disable (
   net user
   echo.
   set /p acc1="User Account to disable: "
   net user %acc% /ACTIVATE:NO
)


