import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/config/di/injector.dart';
import '/config/router/app_router.dart';
import '/shared/constant/palette.dart';
import '/shared/extension/screen_util.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = getIt<AppRouter>();
    ScreenUtil.init(context);

    return GestureDetector(
      onTap: () => primaryFocus?.unfocus(),
      child: SafeArea(
        top: false,
        child: MaterialApp.router(
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(
                context,
              ).copyWith(textScaler: const TextScaler.linear(1.0)),
              child: child!,
            );
          },
          routerConfig: router.config(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Palette.white,
            primaryColor: Palette.primary,
            primaryTextTheme: GoogleFonts.interTextTheme(
              Theme.of(context).primaryTextTheme,
            ),
            textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
          ),
        ),
      ),
    );
  }
}
