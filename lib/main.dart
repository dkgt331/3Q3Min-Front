import 'package:application_3q3min/home/home_screen.dart';
import 'package:application_3q3min/login/login_screen.dart';
import 'package:application_3q3min/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:application_3q3min/tutorial/tutorial.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  bool isLoggedIn = false;
  bool isFirst = true;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: MyApp.themeNotifier,
      builder: (_, ThemeMode currentMode, __) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          darkTheme: ThemeData.dark(),
          themeMode: currentMode,
          home: AnimatedSplashScreen(
            curve: const Cubic(1, 1, 1, 1),
            duration: 6000,
            splash: const SplashTweenAnimationBuilder(),
            splashIconSize: double.infinity,
            pageTransitionType: PageTransitionType.fade,
            animationDuration: const Duration(milliseconds: 500),
            nextScreen: isFirst
                ? const Tutorial()
                : isLoggedIn
                    ? const HomeScreen()
                    : const LoginScreen(),
            backgroundColor: Colors.transparent,
          ),
          // const HomeScreen(),
        );
      },
    );
  }
}

class CustomThemeData {
  static final ThemeData light = ThemeData(
    textTheme: textThemelight,
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            foregroundColor: Colors.black.withOpacity(0.7))),
  );
  static final ThemeData dark = ThemeData(
    scaffoldBackgroundColor: const Color(0xFF61697C),
    textTheme: textThemedark,
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            foregroundColor: Colors.white.withOpacity(0.85))),
  );
  static TextTheme textThemelight = TextTheme(
    bodyMedium: TextStyle(
      fontFamily: 'Helvetica Neue',
      fontWeight: FontWeight.w700,
      color: Colors.black.withOpacity(0.7),
    ),
  );
  static TextTheme textThemedark = TextTheme(
      bodyMedium: TextStyle(
    fontFamily: 'Helvetica Neue',
    fontWeight: FontWeight.w700,
    color: Colors.white.withOpacity(0.85),
  ));
}
