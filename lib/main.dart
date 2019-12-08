import 'package:chorus/global/assets.dart';
import 'package:chorus/global/constants.dart';
import 'package:chorus/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      theme: _buildAppTheme(context),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ru'),
        Locale('pl'),
      ],
      home: SplashScreen(),
    );
  }

  ThemeData _buildAppTheme(BuildContext context) {
    return ThemeData(
      textTheme: Theme.of(context).textTheme.copyWith(
            body1: const TextStyle(
              color: kTextColor,
              fontSize: 12,
              fontFamily: kNotoSansRegularFont,
            ),
          ),
      scaffoldBackgroundColor: kBaseBackgroundColor,
      primaryColor: kChorusColor,
    );
  }
}
