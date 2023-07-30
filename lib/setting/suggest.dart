import 'package:flutter/material.dart';
import 'package:application_3q3min/main.dart';

class Suggest extends StatelessWidget {
  const Suggest({super.key});

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
          ],
        ),
      ),
    );
  }
}
