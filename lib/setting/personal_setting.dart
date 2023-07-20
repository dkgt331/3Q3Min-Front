import 'package:flutter/material.dart';

class PersonalSetting extends StatelessWidget {
  const PersonalSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //뒤로가기 버튼
            Container(
              margin: const EdgeInsets.fromLTRB(41, 67, 0, 0),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Image.asset('assets/back.png')),
            ),
          ],
        ),
      ),
    );
  }
}
