import 'package:application_3q3min/home/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final ValueNotifier<ThemeMode> themeNotifier =
  ValueNotifier(ThemeMode.light);
  static final ValueNotifier<int> qNum = ValueNotifier(3);
  // This widget is the root of your application.
  @override
    Widget build(BuildContext context) {
      return ValueListenableBuilder2(
        first: themeNotifier,
        second: qNum,
        builder: (_, ThemeMode currentMode, int n, __) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            darkTheme: ThemeData.dark(),
            themeMode: currentMode,
            home: const HomeScreen(),
          );
        },
      );
    }
  }

class CustomThemeData {
  static final ThemeData light = ThemeData(
    textTheme: textThemelight,
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: Colors.black.withOpacity(0.7))
    ),
  );
  static final ThemeData dark = ThemeData(
    scaffoldBackgroundColor: const Color(0xFF61697C),
    textTheme: textThemedark,
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: Colors.white.withOpacity(0.85))
    ),
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
      )
  );
}

class ValueListenableBuilder2 extends StatelessWidget {
  const ValueListenableBuilder2({
    required this.first,
    required this.second,
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  final ValueListenable<ThemeMode> first;
  final ValueListenable<int> second;
  final Widget? child;
  final Widget Function(BuildContext context, ThemeMode a, int b, Widget? child) builder;

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<ThemeMode>(
    valueListenable: first,
    builder: (_, a, __) {
      return ValueListenableBuilder<int>(
        valueListenable: second,
        builder: (context, b, __) {
          return builder(context, a, b, child);
        },
      );
    },
  );
}

