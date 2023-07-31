import 'package:flutter/material.dart';
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
            const ItemBox('질문 개수', 70),
            const ItemBox('푸시알람 시간', 224),
            const ItemBox('답변 유형', 100),
          ],
        ),
      ),
    );
  }
}

class ItemBox extends StatelessWidget {
  final String title;
  final double height;
  const ItemBox(this.title, this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 45),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 62),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                letterSpacing: 0.70,
              ),
            ),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 14),
              width: 330,
              height: height,
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
    );
  }
}
