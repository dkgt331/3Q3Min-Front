import 'package:application_3q3min/setting/personal_setting.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

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
                  icon: Image.asset('assets/back.png')
              ),
            ),
            // 사용자 사진 받아오기
            Container(
              margin: const EdgeInsets.only(top: 14),
              child: const Center(
                child: Image(
                    image: AssetImage('assets/pro.png')
                ),
              ),
            ),
            // 사용자 이름 받아오기
            Container(
              margin: const EdgeInsets.only(top: 21, bottom: 47),
              child: const Center(
                child: SizedBox(
                  width: 220,
                  height: 20,
                  child: Text.rich(
                    TextSpan(
                        children: [
                          TextSpan(
                              text: '스큐스', // 이름 받아오기
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Helvetica Neue',
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1,
                              )
                          ),
                          TextSpan(
                              text: '님',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Helvetica Neue',
                                fontWeight: FontWeight.w300,
                                letterSpacing: 1,
                              )
                          ),
                        ]
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            // 구분선
            Center(
              child: Container(
                width: 321,
                decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 0.35,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0x7F88B3F2),
                        )
                    )
                ),
              ),
            ),
            // 개인설정
            Container(
              height: 40,
              margin: const EdgeInsets.only(top: 56),
              child: TextButton(
                onPressed: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const PersonalSetting(),
                      )
                  );
                },
                child: Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(left: 57),
                        child: const Image(image: AssetImage('assets/option.png'))
                    ),
                    Container(
                      width: 220,
                      height: 20,
                      margin: const EdgeInsets.only(left: 23),
                      child: const Text(
                        '개인설정',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Helvetica Neue',
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.80,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            // 공지사항
            Container(
              height: 40,
              margin: const EdgeInsets.only(top: 27),
              child: Row(
                children: [
                  Container(
                      margin: const EdgeInsets.only(left: 57),
                      child: const Image(image: AssetImage('assets/announcement.png'))),
                  Container(
                    width: 220,
                    height: 20,
                    margin: const EdgeInsets.only(left: 23),
                    child: const Text(
                      '공지사항',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Helvetica Neue',
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.80,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 47, bottom: 66),
                      height: 37,
                      child: TextButton(
                          onPressed: () {
                            //로그아웃 기능 구현
                          },
                          child: const Text('로그아웃',
                            style:  TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                      ),
                    ),
                    // 스위치 만들기
                    // https://gist.github.com/jpmehedi/a1f170bdd7b5fb5c0adb6fe97638644e
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
