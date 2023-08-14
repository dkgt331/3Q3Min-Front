import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:application_3q3min/login/login_screen.dart';
import 'package:application_3q3min/main.dart';

class LogOut extends StatelessWidget {
  const LogOut({super.key});

  @override
  Widget build(BuildContext context) {
    var themeMode = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      theme: CustomThemeData.light,
      darkTheme: CustomThemeData.dark,
      themeMode: themeMode.themeNotifier,
      home: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(flex: 22),
              const Image(image: AssetImage('assets/logout.png')),
              const Spacer(flex: 8),
              const Text(
                '로그아웃하면 더 이상\n기록을 이어나갈 수 없습니다.\n\n로그아웃 하시겠습니까?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  letterSpacing: 0.85,
                ),
              ),
              const Spacer(flex: 8),
              Container(
                width: 163,
                height: 52,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(46),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 2,
                      offset: Offset(0, 2),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => const LoginScreen()),
                              (route) => false);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: themeMode.themeNotifier == ThemeMode.dark
                          ? const Color(0xFF575F70)
                          : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(46),
                      ),
                    ),
                    child: const Text(
                      '로그아웃',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFF36666),
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.75,
                      ),
                    )),
              ),
              const Spacer(flex: 2),
              Container(
                width: 163,
                height: 52,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(46),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 2,
                      offset: Offset(0, 2),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: themeMode.themeNotifier == ThemeMode.dark
                          ? const Color(0xFF575F70)
                          : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(46),
                      ),
                    ),
                    child: Text(
                      '취소',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: themeMode.themeNotifier == ThemeMode.dark
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.75,
                      ),
                    )),
              ),
              const Spacer(flex: 15)
            ],
          ),
        ),
      ),
    );
  }
}
