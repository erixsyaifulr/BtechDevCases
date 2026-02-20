import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/config/di/injector.dart';
import 'app.dart';
import 'shared/constant/palette.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Injector.initialize();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Palette.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const MyApp());
}
