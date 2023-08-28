import 'package:flutter/material.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:application_3q3min/main.dart';
import 'package:provider/provider.dart';

class PersonalSetting extends StatefulWidget {
  const PersonalSetting({super.key});

  @override
  State<PersonalSetting> createState() => _PersonalSettingState();
}

class _PersonalSettingState extends State<PersonalSetting> {
  bool _isShortAnswer = false;

  Widget setTime(double n) {
    var qTime = Provider.of<QTime>(context, listen: false);
    int index = n.toInt() - 1;
    return TextButton(
      onPressed: () {
        _openTimePicker(context, n, qTime.timeList[index]);
      },
      child: Consumer<QTime>(builder: (context, qtime, child) {
        return SizedBox(
            width: 330,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Opacity(
                  opacity: 0.6,
                  child: Text("Q$n",
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w700)),
                ),
                Container(
                    width: 37,
                    alignment: Alignment.centerRight,
                    child: Text(
                        qTime.timeList[index].hour <= 12
                            ? "${qTime.timeList[index].hour}"
                            : "${qTime.timeList[index].hour - 12}",
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w700))),
                const Text(":",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                Container(
                    width: 37,
                    alignment: Alignment.centerRight,
                    child: Text(
                        qTime.timeList[index].minute > 9
                            ? "${qTime.timeList[index].minute}"
                            : "0${qTime.timeList[index].minute}",
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w700))),
                Text(qTime.timeList[index].hour < 12 ? 'AM' : 'PM',
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w700)),
              ],
            ));
      }),
    );
  }

  void _incrementCounter() {
    var qNum = Provider.of<QNum>(context, listen: false);
    var qTime = Provider.of<QTime>(context, listen: false);
    setState(() {
      qNum.qNum < 10 ? qTime.addTime() : qNum.qNum;
      qNum.qNum < 10 ? listItems.add(setTime(qNum.qNum + 1)) : listItems;
      qNum.qNum < 10 ? qNum.increse() : qNum.qNum;
      _isTouch ? _height = 67 + 48 * qNum.qNum : _height;
    });
  }

  void _decrementCounter() {
    var qNum = Provider.of<QNum>(context, listen: false);
    var qTime = Provider.of<QTime>(context, listen: false);
    setState(() {
      qNum.qNum > 3 ? qTime.removeTime() : qNum.qNum;
      qNum.qNum > 3 ? listItems.removeLast() : listItems;
      qNum.qNum > 3 ? qNum.decrese() : qNum.qNum;
      _isTouch ? _height = 67 + 48 * qNum.qNum : _height;
    });
  }

  double _height = 52;
  bool _isTouch = false;
  List<Widget> listItems = [];

  @override
  void initState() {
    var qNum = Provider.of<QNum>(context, listen: false);
    super.initState();
    for (int i = 1; i <= qNum.qNum; i++) {
      listItems.add(setTime(i.toDouble()));
    }
  }

  void _changeHeight() {
    var qNum = Provider.of<QNum>(context, listen: false);
    setState(() {
      _isTouch = _isTouch == false ? true : false;
      _isTouch == false ? _height = 52 : _height = 67 + 47 * qNum.qNum;
    });
  }

  void _openTimePicker(BuildContext context, double n, DateTime init) {
    var qTime = Provider.of<QTime>(context, listen: false);
    int index = n.toInt() - 1;
    BottomPicker.time(
      title: "Q$n",
      onSubmit: (time) {
        qTime.changeTime(time, index);
        //제출 버튼을 누르고 나면 text를 다시 랜더링해줘야 함
      },
      initialDateTime: init,
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    var themeMode = Provider.of<ThemeNotifier>(context);
    var isShort = Provider.of<IsShort>(context);
    var qNum = Provider.of<QNum>(context, listen: false);
    return MaterialApp(
      theme: CustomThemeData.light,
      darkTheme: CustomThemeData.dark,
      themeMode: themeMode.themeNotifier,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
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
                          color: themeMode.themeNotifier == ThemeMode.dark
                              ? const Color(0xFF575F70)
                              : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                                onPressed: _decrementCounter,
                                icon: Image.asset('assets/minus.png')),
                            AnimatedFlipCounter(
                              value: qNum.qNum,
                              textStyle: const TextStyle(
                                fontSize: 30,
                              ),
                            ),
                            IconButton(
                                onPressed: _incrementCounter,
                                icon: Image.asset('assets/plus.png')),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Center(
                  child: AnimatedContainer(
                margin: const EdgeInsets.only(top: 19),
                width: 330,
                height: _height,
                duration: const Duration(milliseconds: 100),
                decoration: ShapeDecoration(
                  color: themeMode.themeNotifier == ThemeMode.dark
                      ? const Color(0xFF575F70)
                      : Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 19),
                            child: const Text(
                              '푸시알림 시간',
                              style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 0.70,
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: _changeHeight,
                              icon: Image.asset('assets/rightarrow.png')),
                        ],
                      ),
                      _isTouch == true
                          ? Column(
                            children: [
                              Container(
                                width: 330,
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1,
                                      strokeAlign: BorderSide.strokeAlignCenter,
                                      color: themeMode.themeNotifier ==
                                              ThemeMode.dark
                                          ? const Color(0xFF61697C)
                                          : const Color(0xFFF9F9F9),
                                    ),
                                  ),
                                ),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: listItems,
                                ),
                              )
                            ],
                          )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
              )),
              !_isTouch
                  ? Container(
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
                                color: themeMode.themeNotifier == ThemeMode.dark
                                    ? const Color(0xFF575F70)
                                    : Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17),
                                ),
                              ),
                              child: Center(
                                child: CustomSwitch(
                                  value: _isShortAnswer,
                                  onChanged: (value) {
                                    setState(() {
                                      _isShortAnswer = value;
                                      isShort.isShortChange();
                                    });
                                  },
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  : const SizedBox.shrink()
            ],
          ),
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
        vsync: this, duration: const Duration(milliseconds: 100));
    _circleAnimation = AlignmentTween(
            begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
            end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    var themeMode = Provider.of<ThemeNotifier>(context);
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
            width: 281,
            height: 53,
            decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17)),
                color: themeMode.themeNotifier == ThemeMode.light
                    ? const Color(0xFFCECECE)
                    : Colors.white.withOpacity(0.5)),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 6.0, bottom: 6.0, right: 7.0, left: 7.0),
              child: Stack(children: [
                AnimatedAlign(
                  duration: const Duration(milliseconds: 100),
                  alignment: widget.value
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    width: 133,
                    height: 41,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13)),
                      color: themeMode.themeNotifier == ThemeMode.light
                          ? const Color(0xFFF9F9F9)
                          : const Color(0xFF6A7386),
                    ),
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 130,
                        child: Center(
                            child: Text('선택형',
                                style: TextStyle(
                                  color:
                                      themeMode.themeNotifier == ThemeMode.light
                                          ? _circleAnimation.value ==
                                                  Alignment.centerLeft
                                              ? const Color(0xFF757575)
                                              : const Color(0xFFF9F9F9)
                                          : _circleAnimation.value ==
                                                  Alignment.centerLeft
                                              ? Colors.white.withOpacity(0.9)
                                              : Colors.black.withOpacity(0.5),
                                  fontSize: 15,
                                ))),
                      ),
                      SizedBox(
                        width: 130,
                        child: Center(
                            child: Text('단답형',
                                style: TextStyle(
                                  color:
                                      themeMode.themeNotifier == ThemeMode.light
                                          ? _circleAnimation.value ==
                                                  Alignment.centerLeft
                                              ? const Color(0xFFF9F9F9)
                                              : const Color(0xFF757575)
                                          : _circleAnimation.value ==
                                                  Alignment.centerLeft
                                              ? Colors.black.withOpacity(0.5)
                                              : Colors.white.withOpacity(0.9),
                                  fontSize: 15,
                                ))),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        );
      },
    );
  }
}
