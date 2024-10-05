import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_full_news_app/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

@immutable
class ApplicationStart {
  const ApplicationStart._();
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    DeviceUtility.instance;
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
