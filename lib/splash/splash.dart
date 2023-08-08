import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:async';

class SplashTweenAnimationBuilder extends StatefulWidget {
  const SplashTweenAnimationBuilder({super.key});

  @override
  State <SplashTweenAnimationBuilder> createState() => _SplashTweenAnimationBuilderState();
}

class _SplashTweenAnimationBuilderState extends State<SplashTweenAnimationBuilder>{
  double targetAngle = 00.0;
  double targetSize = 40;
  late Timer _timer;
  double _milliseconds = -200;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (_milliseconds <= 6000){
        setState(() {
          _milliseconds += 100;
        });
      }
      setTarget();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: targetAngle),
          duration: Duration(milliseconds: 500),
          builder: (BuildContext context, double angle, Widget? child) {
            return TweenAnimationBuilder(
              tween: Tween<double>(begin: 40, end: targetSize),
              curve: Curves.easeInOutBack,
              duration: Duration(milliseconds: 800),
              builder: (BuildContext context, double size, Widget? child) {
                return Transform.scale(
                  scale: size,
                  child: Transform.rotate(
                    angle: angle * math.pi / 180,
                    child: Image.asset(
                      'assets/home_button.png',
                      alignment: Alignment.center,
                    ),
                  ),
                );
              }  
            );
          },
        ),
      ),
    );
  }

  void setTarget() {
    if (_milliseconds <= 6000) {
      setState(() {
        if(_milliseconds == 500) {
          targetSize = 2;
        }
        if (_milliseconds % 2000 == 0) {
          targetAngle += 90;
        }
        if (_milliseconds == 6000) {
          targetSize = 40;
        }
      });
    }
  }
}
