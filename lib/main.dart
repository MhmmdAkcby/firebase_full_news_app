import 'package:firebase_full_news_app/feature/auth/authentication_view.dart';
import 'package:firebase_full_news_app/product/constants/string_constants.dart';
import 'package:firebase_full_news_app/product/initiallize/application_start_init.dart';
import 'package:firebase_full_news_app/product/initiallize/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  await ApplicationStart.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringConstants.appName,
      home: const AuthenticationView(),
      theme: AppTheme(context).theme,
    );
  }
}
