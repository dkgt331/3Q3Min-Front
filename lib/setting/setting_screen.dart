import 'package:flutter/material.dart';

import 'package:application_3q3min/main.dart';
import 'package:application_3q3min/setting/announcement.dart';
import 'package:application_3q3min/setting/personal_setting.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SettingScreen();
  }
}

class _SettingScreen extends State<SettingScreen> {
  var _isSwitched = MyApp.themeNotifier.value == ThemeMode.light ? false : true;

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
            //뒤로가기 버튼
            Container(
              margin: const EdgeInsets.fromLTRB(41, 67, 0, 0),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Image.asset('assets/back.png')),
            ),
            // 사용자 사진 받아오기
            Container(
              margin: const EdgeInsets.only(top: 14),
              child: const Center(
                child: Image(image: AssetImage('assets/pro.png')),
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
                    TextSpan(children: [
                      TextSpan(
                          text: '스큐스', // 이름 받아오기
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1,
                          )),
                      TextSpan(
                          text: '님',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 1,
                          )),
                    ]),
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
                ))),
              ),
            ),
            // 클릭박스
            SizedBox(
              child: Container(
                height: 142,
                margin: const EdgeInsets.fromLTRB(32, 28, 32, 0),
                decoration: ShapeDecoration(
                    color: _isSwitched
                        ? const Color(0xFF575F70)
                        : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                    )),
                child: Column(
                  children: [
                    // 개인 설정
                    Container(
                      height: 54,
                      margin: const EdgeInsets.only(top: 11),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const PersonalSetting(),
                          ));
                        },
                        child: Row(
                          children: [
                            Container(
                                margin: const EdgeInsets.only(left: 16),
                                child: const Image(
                                    image: AssetImage('assets/option.png'))),
                            Expanded(
                              child: Container(
                                width: 220,
                                height: 20,
                                margin: const EdgeInsets.only(left: 23),
                                child: const Text(
                                    '개인설정',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.80,
                                    ),
                                  ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 19),
                              child: const Image(
                                image: AssetImage('assets/rightarrow.png'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    // 공지사항
                    Container(
                      height: 54,
                      margin: const EdgeInsets.only(top: 11),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Announcement()));
                        },
                        child: Row(
                          children: [
                            Container(
                                margin: const EdgeInsets.only(left: 16),
                                child: const Image(
                                    image:
                                        AssetImage('assets/announcement.png'))),
                            Expanded(
                              child: Container(
                                width: 220,
                                height: 20,
                                margin: const EdgeInsets.only(left: 23),
                                child: const Text(
                                  '공지사항',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.80,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 19),
                              child: const Image(
                                image: AssetImage('assets/rightarrow.png'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(left: 47, bottom: 64),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 2),
                        height: 37,
                        child: TextButton(
                            onPressed: () {
                              //로그아웃 기능 구현
                            },
                            child: const Text(
                              '로그아웃',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                      ),
                      // 스위치 만들기
                      Container(
                        margin: const EdgeInsets.only(right: 53),
                        child: CustomSwitch(
                          value: _isSwitched, // 다크 모드와 연결하기
                          onChanged: (value) {
                            setState(() {
                              _isSwitched = value;
                              MyApp.themeNotifier.value = _isSwitched
                                  ? ThemeMode.dark
                                  : ThemeMode.light;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
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
