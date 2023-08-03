import 'package:flutter/material.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:application_3q3min/main.dart';

class PersonalSetting extends StatelessWidget {
  const PersonalSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomThemeData.light,
      darkTheme: CustomThemeData.dark,
      themeMode: MyApp.themeNotifier.value,
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 상단
            Container(
              margin: const EdgeInsets.only(top: 67),
              height: 44,
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 41),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Image.asset('assets/back.png')),
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      '개인설정',
                      style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 1,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 31),
                width: 321,
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 0.35,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Color(0x7F88B3F2),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 45),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 62),
                    child: const Text(
                      '질문 개수',
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 0.70,
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 14),
                      width: 330,
                      height: 78,
                      decoration: ShapeDecoration(
                        color: MyApp.themeNotifier.value == ThemeMode.dark
                            ? const Color(0xFF575F70)
                            : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17),
                        ),
                      ),
                      child: const Counter(),
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 19),
                width: 330,
                height: 52,
                padding: const EdgeInsets.only(left: 19),
                decoration: ShapeDecoration(
                  color: MyApp.themeNotifier.value == ThemeMode.dark
                      ? const Color(0xFF575F70)
                      : Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '푸시알림 시간',
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 0.70,
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset('assets/rightarrow.png')),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 45),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 62),
                    child: const Text(
                      '답변 유형',
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 0.70,
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 14),
                      width: 330,
                      height: 100,
                      decoration: ShapeDecoration(
                        color: MyApp.themeNotifier.value == ThemeMode.dark
                            ? const Color(0xFF575F70)
                            : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 3;

  void _incrementCounter() {
    setState(() {
      _counter < 10 ? _counter++ : _counter;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter > 3 ? _counter-- : _counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
            onPressed: _decrementCounter,
            icon: Image.asset('assets/minus.png')),
        AnimatedFlipCounter(
          value: _counter,
          duration: const Duration(milliseconds: 500),
          textStyle: const TextStyle(
            fontSize: 30,
          ),
        ),
        IconButton(
            onPressed: _incrementCounter,
            icon: Image.asset('assets/plus.png')),
      ],
    );
  }
}
