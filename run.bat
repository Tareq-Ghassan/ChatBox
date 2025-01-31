@echo off

if "%1"=="" (
    echo Usage: run.bat [command]
    echo Commands:
    echo   clean               Clean the project and pub get dependencies.
    echo   test                Run the test.
    echo   test_clean          Run the test after clean project.
    echo   build_android_apk   Build the Android app as an APK.
    echo   build_android_aab   Build the Android app as an app bundle.
    echo   help, -h            Show this help menu.
    exit /b 0
)

if "%1"=="clean" (
    echo cleaning flutter...
    flutter clean

    echo Running flutter pub get...
    flutter pub get

    echo Done!
    exit /b 0
)

if "%1"=="test" (
    echo Running build_runner...
    flutter pub run build_runner build
    echo Done!
    exit /b 0
)
if "%1"=="test_clean" (
    echo Cleaning Flutter...
    flutter clean

    echo Running build_runner...
    dart run build_runner build --delete-conflicting-outputs

    echo Running flutter pub get...
    flutter pub get

    echo Done!
    exit /b 0
)

if "%1"=="build_android_apk" (
    echo Changing directory to android...
    cd android

    echo stop gradle
    gradlew --stop

    echo back to project root ...
    cd..

    echo cleaning flutter...
    flutter clean

    echo Running flutter pub get...
    flutter pub get
          
    echo Building Android app...
    flutter build apk --release
    exit /b 0
)

if "%1"=="build_android_aab" (
    echo Changing directory to android...
    cd android

    echo stop gradle
    gradlew --stop

    echo back to project root ...
    cd..
    
    echo cleaning flutter...
    flutter clean
           
    echo Running flutter pub get...
    flutter pub get

    echo Building Android app...
    flutter build appbundle --release
    exit /b 0
)

if "%1"=="help" goto show_help
if "%1"=="-h" goto show_help

echo Invalid command! Use "run.bat help" to see available commands.
exit /b 1
