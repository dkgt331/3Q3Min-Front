import 'package:flutter/material.dart';
import 'package:application_3q3min/setting/suggest.dart';
import 'package:application_3q3min/main.dart';
import 'package:provider/provider.dart';

class Announcement extends StatelessWidget {
  const Announcement({super.key});

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
                      '공지사항',
                      style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: const EdgeInsets.only(right: 47),
                      child: IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Suggest()));
                          },
                        icon: Image.asset('assets/suggest.png'),
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
            const ItemBox('업데이트', 107),
            const ItemBox('알림', 309),
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
    var themeMode = Provider.of<ThemeNotifier>(context);
    return Container(
      margin: const EdgeInsets.only(top: 70),
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
                color: themeMode.themeNotifier == ThemeMode.dark
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

//ListView로 구현하기
//https://velog.io/@yunuchoiii/Flutter-내맘대로-위젯-만들기-Custom-Widget-ListView