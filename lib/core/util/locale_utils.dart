part of 'util.dart';


/// [appLocalizations] function that return [AppLocalizations]
AppLocalizations get appLocalizations =>
    AppLocalizations.of(KNavigator.navigatorKey.currentContext!)!;
