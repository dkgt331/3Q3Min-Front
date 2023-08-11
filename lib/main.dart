import 'package:application_3q3min/home/home_screen.dart';
import 'package:application_3q3min/login/login_screen.dart';
import 'package:application_3q3min/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:application_3q3min/tutorial/tutorial.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => QNum()),
    ChangeNotifierProvider(create: (_) => ThemeNotifier()),
    ChangeNotifierProvider(create: (_) => IsShort()),
    ChangeNotifierProvider(create: (_) => QTime()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  bool isLoggedIn = false;
  bool isFirst = true;

  @override
  Widget build(BuildContext context) {
    var themeMode = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: themeMode.themeNotifier,
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

class QNum with ChangeNotifier {
  double _qNum = 3;
  double get qNum => _qNum;

  void increse() {
    _qNum++;
    notifyListeners();
  }

  void decrese() {
    _qNum--;
    notifyListeners();
  }
}

class ThemeNotifier with ChangeNotifier {
  ThemeMode _themeNotifier = ThemeMode.light;
  ThemeMode get themeNotifier => _themeNotifier;

  void themeChange() {
    _themeNotifier =
        _themeNotifier == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class IsShort with ChangeNotifier {
  bool _ishShort = false;
  bool get isShort => _ishShort;

  void isShortChange() {
    _ishShort = !_ishShort;
    notifyListeners();
  }
}

class QTime with ChangeNotifier {
  final List<DateTime> _timeList = [
    DateTime(2023, 8, 10, 7, 00),
    DateTime(2023, 8, 10, 12, 00),
    DateTime(2023, 8, 10, 18, 00)
  ];
  List get timeList => _timeList;

  void addTime() {
    _timeList.add(DateTime(2023, 8, 10, 0, 0));
    notifyListeners();
  }

  void removeTime() {
    _timeList.removeLast();
    notifyListeners();
  }

  void changeTime(DateTime setTime, int index) {
    _timeList[index] = setTime;
    _timeList.sort();
    notifyListeners();
  }
}
