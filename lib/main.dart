import 'package:firebase_full_news_app/feature/splash/splash_view.dart';
import 'package:firebase_full_news_app/product/constants/string_constants.dart';
import 'package:firebase_full_news_app/product/initiallize/application_start_init.dart';
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
    return const MaterialApp(
      title: StringConstants.appName,
      home: SplashView(),
    );
  }
}
