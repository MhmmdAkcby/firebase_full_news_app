import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

@immutable
class AppTheme {
  const AppTheme(this.context);

  final BuildContext context;
  ThemeData get theme => ThemeData.light(
        useMaterial3: false,
      ).copyWith(
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            padding: WidgetStateProperty.all<EdgeInsets>(
              const EdgeInsets.all(15),
            ),
            textStyle: WidgetStatePropertyAll<TextStyle?>(
              context.general.textTheme.headlineSmall,
            ),
            backgroundColor: const WidgetStatePropertyAll<Color>(Colors.blue),
            foregroundColor: const WidgetStatePropertyAll<Color>(Colors.white),
          ),
        ),
      );
}
