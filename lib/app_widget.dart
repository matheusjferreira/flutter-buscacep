import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'shared/core/app_theme.dart';
import 'shared/core/change_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ThemeData>(
      initialData: AppTheme.lightTheme.getTheme,
      stream: ChangeTheme.of(context)!.streamController.stream,
      builder: (context, snapshot) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'My Smart App',
        theme: snapshot.data,
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
      ),
    );
  }
}
