@echo off
setlocal

echo Building the Flutter app in release mode...
call flutter build apk --release

echo Installing the app on the connected Android device...
call adb install build\app\outputs\flutter-apk\app-release.apk

echo Done.
pause
