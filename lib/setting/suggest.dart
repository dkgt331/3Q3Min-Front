import 'package:flutter/material.dart';
import 'package:application_3q3min/main.dart';
import 'package:provider/provider.dart';

class Suggest extends StatelessWidget {
  const Suggest({super.key});

  @override
  Widget build(BuildContext context) {
    var themeMode = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      theme: CustomThemeData.light,
      darkTheme: CustomThemeData.dark,
      themeMode: themeMode.themeNotifier,
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
                      '건의하기',
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
            Center(
              child: Container(
                  margin: const EdgeInsets.only(top: 33),
                  width: 330,
                  height: 344,
                  decoration: ShapeDecoration(
                    color: themeMode.themeNotifier == ThemeMode.dark
                        ? const Color(0xFF575F70)
                        : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 20),
                          child: IconButton(
                              onPressed: () {}, // 건의사항 보내기
                              icon: Image.asset('assets/check.png')),
                        ),
                      ),
                      Container(
                        width: 330,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: themeMode.themeNotifier == ThemeMode.dark
                                  ? const Color(0xFF61697C)
                                  : const Color(0xFFF9F9F9),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 28),
                        child: Opacity(
                          opacity: 0.4,
                          child: TextField(
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.60,
                            ),
                            decoration: InputDecoration(
                              hintText: '최소 10자 이상의 문자를 입력해주세요.',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
