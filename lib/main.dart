import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_module.dart';
import 'app_widget.dart';
import 'shared/core/change_theme.dart';

void main() {
  return runApp(ModularApp(
      module: AppModule(), child: ChangeTheme(child: const AppWidget())));
}
