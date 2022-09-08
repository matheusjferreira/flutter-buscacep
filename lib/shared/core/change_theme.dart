import 'dart:async';
import 'package:flutter/material.dart';

class ChangeTheme extends InheritedWidget {
  final StreamController<ThemeData> streamController = StreamController();

  ChangeTheme({super.key, required super.child});

  static ChangeTheme? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ChangeTheme>();
  }

  @override
  bool updateShouldNotify(ChangeTheme oldWidget) {
    return oldWidget != this;
  }
}
