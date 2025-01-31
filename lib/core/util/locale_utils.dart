part of 'util.dart';

AppLocalizations? _appLocalizations;

/// [appLocalizations] function that return [AppLocalizations]
AppLocalizations get appLocalizations =>
    _appLocalizations ??
    AppLocalizations.of(KNavigator.navigatorKey.currentContext!)!;

set appLocalizations(AppLocalizations val) => _appLocalizations = val;
