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
  void _incrementCounter() {
    setState(() {
      MyApp.qNum.value < 10 ? MyApp.qNum.value++ : MyApp.qNum.value;
    });
  }

  void _decrementCounter() {
    setState(() {
      MyApp.qNum.value > 3 ? MyApp.qNum.value-- : MyApp.qNum.value;
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
          value: MyApp.qNum.value,
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

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({super.key, required this.value, required this.onChanged});

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  late Animation _circleAnimation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 60));
    _circleAnimation = AlignmentTween(
        begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
        end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
        parent: _animationController, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController.isCompleted) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
            widget.value == false
                ? widget.onChanged(true)
                : widget.onChanged(false);
          },
          child: Container(
            width: 77,
            height: 36,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1000),
                color: _circleAnimation.value == Alignment.centerLeft
                    ? const Color(0xFF88B3F2)
                    : const Color(0xFF5481CF)),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 4.0, bottom: 4.0, right: 5.0, left: 5.0),
              child: Container(
                alignment:
                widget.value ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _circleAnimation.value == Alignment.centerLeft
                        ? const Color(0xFFFFF071)
                        : const Color(0xFFE5E1BC),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
