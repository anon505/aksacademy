import 'dart:io';

import 'package:aksacademy/common/my_http_overrides.dart';
import 'package:aksacademy/my_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:aksacademy/injection.dart' as di;
import 'package:intl/intl.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init('prod');

  Intl.defaultLocale = 'id';
  HttpOverrides.global = MyHttpOverrides();
  await di.locator.allReady();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}
