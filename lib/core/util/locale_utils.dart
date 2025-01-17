import 'package:chat/core/routes/route.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// [appLocalizations] function that return [AppLocalizations]
AppLocalizations get appLocalizations =>
    AppLocalizations.of(KNavigator.navigatorKey.currentContext!)!;
