import 'package:flutter/material.dart';

import '../models/settings_model.dart';

/// Свой Theme.of, только для настроек.
class SettingsScope extends InheritedNotifier<SettingsModel> {
  const SettingsScope({
    super.key,
    required SettingsModel settings,
    required super.child,
  }) : super(notifier: settings);

  static SettingsModel of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<SettingsScope>();
    assert(scope != null, 'SettingsScope не найден выше по дереву');
    return scope!.notifier!;
  }
}
