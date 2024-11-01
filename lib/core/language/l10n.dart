// import 'package:trigger_app/imports_bindings.dart';

import 'package:trigger_app/core/language/l10n.dart';
import 'package:flutter/material.dart';

export 'package:flutter_gen/gen_l10n/app_localizations.dart';

///
extension AppLocalizationsX on BuildContext {
  ///
  AppLocalizations get lang => AppLocalizations.of(this);
}
