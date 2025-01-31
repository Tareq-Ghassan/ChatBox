# run for mac
function show_help() {
    echo "Usage: $0 [command]"
    echo "Commands:"
    echo "  clean               Clean the project and pub get dependency."
    echo "  test                Run the test."
    echo "  test_clean          Run the test after clean project."
    echo "  build_android_apk   Build the Android app as an APK."
    echo "  build_android_aab   Build the Android app as an app bundle."
    echo "  build_ios           Build the iOS app."
    echo "  help, -h            Show this help menu."
}

if [ -z "$1" ]; then
    show_help
    exit 0
fi

case $1 in
    clean)
        echo "cleaning flutter..."
        flutter clean

        echo "Running flutter pub get..."
        flutter pub get

        echo "Running flutter gen-l10n..."
        flutter gen-l10n

        echo "Done!"
        ;;
    test)
        echo "Running build_runner..."
        flutter pub run build_runner build

        echo "Done!"
        ;;
    test_clean)
        echo "cleaning flutter..."
        flutter clean

        echo "Running build_runner..."
        dart run build_runner build --delete-conflicting-outputs

        echo "Running flutter pub get..."
        flutter pub get

        echo "Running flutter gen-l10n..."
        flutter gen-l10n

        echo "Done!"
        ;;
    build_android_apk)
        echo "change direction to android ..."
        cd android

        echo "stop gradle"
        ./gradlew --stop

        echo "back to project root ..."
        cd..

        echo "cleaning flutter..."
        flutter clean

        echo "Running flutter pub get..."
        flutter pub get

        echo "Running flutter gen-l10n..."
        flutter gen-l10n

        echo "Building Android app..."
        flutter build apk --release
        ;;
    build_android_aab)
        echo "change direction to android ..."
        cd android

        echo "stop gradle"
        ./gradlew --stop

        echo "back to project root ..."
        cd..

        echo "cleaning flutter..."
        flutter clean

        echo "Running flutter pub get..."
        flutter pub get

        echo "Running flutter gen-l10n..."
        flutter gen-l10n

        echo "Building Android app..."
        flutter build appbundle --release
        ;;
    build_ios)
        echo "cleaning flutter..."
        flutter clean

        echo "Running flutter pub get..."
        flutter pub get

        echo "Running flutter gen-l10n..."
        flutter gen-l10n

        echo "change direction to ios ..."
        cd ios

        echo "installing pods"
        pod install

        echo "You are ready to archive!!"
        ;;
    help|-h)
        show_help
        ;;
    *)
        echo "Invalid command!"
        show_help
        exit 1
        ;;
esac