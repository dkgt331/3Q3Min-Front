import 'package:application_3q3min/calendar/modify_answer_dialog.dart';
import 'package:application_3q3min/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  List dateList = [];

  int year = 0;
  int month = 0;

  int selectedDay = 0;

  bool isDragUp = false;

  void setDateList(int setYear, int setMonth) {
    year = setYear;
    month = setMonth;

    final firstDayOfMonth = DateTime(year, month, 1);
    final firstDay = firstDayOfMonth.weekday - 1;
    final lastDate = DateTime(year, month + 1, 0).day;

    dateList = ["월", "화", "수", "목", "금", "토", "일"];

    for (int i = 0; i < firstDay; i++) {
      dateList.add(-1);
    }

    for (int i = 1; i <= lastDate; i++) {
      dateList.add(i);
    }

    setState(() {});
  }

  Widget CalendarWidget(final theme) {
    bool isLightTheme = (theme == ThemeMode.light);
    return Opacity(
      opacity: isLightTheme ? 0.90 : 0.40,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 36),
        height: 380,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(17)),
            color: isLightTheme ? Colors.white : const Color(0xFF000235)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 16,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        if (month == 1) {
                          year = year - 1;
                          month = 12;
                        } else {
                          month = month - 1;
                        }
                        setState(() {});

                        setDateList(year, month);
                      },
                      child: Image.asset(
                        "assets/calendar_back_arrow.png",
                        width: 16,
                      )),
                  const Expanded(child: SizedBox()),
                  Text(
                    "${year.toString()}년 ${month.toString()}월",
                    style: TextStyle(
                      color:
                          isLightTheme ? const Color(0xFF4A5660) : Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  GestureDetector(
                      onTap: () {
                        if (month == 12) {
                          year = year + 1;
                          month = 1;
                        } else {
                          month = month + 1;
                        }
                        setState(() {});

                        setDateList(year, month);
                      },
                      child: Image.asset(
                        "assets/calendar_next_arrow.png",
                        width: 16,
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26.0),
                  child: GridView.count(
                    padding: const EdgeInsets.all(0.0),
                    crossAxisCount: 7,
                    childAspectRatio: 1 / 1,
                    physics: const NeverScrollableScrollPhysics(),
                    children: List.generate(dateList.length, (index) => index)
                        .map((e) => GestureDetector(
                              onTap: () {
                                if (dateList[e] != -1) {
                                  setState(() {
                                    selectedDay = dateList[e];
                                  });
                                }
                              },
                              child: Container(
                                  width: 36,
                                  height: 36,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: dateList[e] == selectedDay
                                          ? const BorderRadius.all(
                                              Radius.circular(60))
                                          : null,
                                      color: dateList[e] == selectedDay
                                          ? isLightTheme
                                              ? const Color(0xFFFFCE71)
                                              : const Color(0xFF5481CF)
                                          : null),
                                  child: Text(
                                    dateList[e] == -1
                                        ? ""
                                        : dateList[e].toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: isLightTheme
                                          ? Colors.black
                                          : Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )),
                            ))
                        .toList(),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 26,
            )
          ],
        ),
      ),
    );
  }

  Widget CalendarDetailWidget(final theme) {
    bool isLightTheme = (theme == ThemeMode.light);

    return Opacity(
        opacity: 0.90,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 36),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(17), topRight: Radius.circular(17)),
              gradient: LinearGradient(
                  begin: const Alignment(0.00, -1.00),
                  end: const Alignment(0, 1),
                  colors: isLightTheme
                      ? [Colors.white, Colors.white.withOpacity(0)]
                      : [const Color(0x66000235), const Color(0x00000235)])),
          child: Column(
            children: [
              Row(
                children: [
                  const Expanded(child: SizedBox()),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isDragUp = !isDragUp;
                      });
                    },
                    onVerticalDragEnd: (details) {
                      setState(() {
                        isDragUp = !isDragUp;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Opacity(
                        opacity: 0.15,
                        child: Container(
                          height: 6,
                          width: 90,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(40)),
                              color: isLightTheme
                                  ? const Color(0xFF000000)
                                  : Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const Expanded(child: SizedBox())
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  month.toString().length == 2
                      ? selectedDay.toString().length == 2
                          ? "$year.$month.$selectedDay"
                          : "$year.$month.0$selectedDay"
                      : selectedDay.toString().length == 2
                          ? "$year.0$month.$selectedDay"
                          : "$year.0$month.0$selectedDay",
                  style: TextStyle(
                    color: isLightTheme
                        ? Colors.black.withOpacity(0.7)
                        : Colors.white.withOpacity(0.85),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                height: 0.5,
                margin: const EdgeInsets.symmetric(horizontal: 30.0),
                color: isLightTheme
                    ? Colors.black.withOpacity(0.2)
                    : Colors.white.withOpacity(0.2),
              ),
              if (!isDragUp)
                const SizedBox(
                  height: 24.0,
                ),
              if (isDragUp)
                Column(
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => const ModifyAnswerDialog(
                                  question: "오늘은 누구를 만나셨나요?",
                                  answer: "지수와 예희",
                                ));
                      },
                      child: Column(children: [
                        SizedBox(
                          height:
                              (MediaQuery.of(context).size.height - 540) / 6,
                        ),
                        Text(
                          "Q. 오늘은 누구를 만나셨나요?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: isLightTheme ? Colors.black : Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const SizedBox(
                          height: 34,
                        ),
                        Text.rich(TextSpan(children: [
                          TextSpan(
                            text: "A. ",
                            style: TextStyle(
                              color: isLightTheme ? Colors.black : Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          TextSpan(
                            text: "지수와 예희",
                            style: TextStyle(
                              color: isLightTheme ? Colors.black : Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ])),
                        SizedBox(
                          height:
                              (MediaQuery.of(context).size.height - 540) / 6,
                        ),
                      ]),
                    ),
                    Container(
                      height: 0.5,
                      margin: const EdgeInsets.symmetric(horizontal: 30.0),
                      color: isLightTheme
                          ? Colors.black.withOpacity(0.2)
                          : Colors.white.withOpacity(0.2),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => const ModifyAnswerDialog(
                                  question: "아침에 무엇을 드셨나요?",
                                  answer: "오이냉국",
                                ));
                      },
                      child: Column(children: [
                        SizedBox(
                          height:
                              (MediaQuery.of(context).size.height - 540) / 6,
                        ),
                        // const Expanded(child: SizedBox()),
                        Text(
                          "Q. 아침에 무엇을 드셨나요?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: isLightTheme ? Colors.black : Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const SizedBox(
                          height: 34,
                        ),
                        Text.rich(TextSpan(children: [
                          TextSpan(
                            text: "A. ",
                            style: TextStyle(
                              color: isLightTheme ? Colors.black : Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          TextSpan(
                            text: "오이냉국",
                            style: TextStyle(
                              color: isLightTheme ? Colors.black : Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ])),
                        SizedBox(
                          height:
                              (MediaQuery.of(context).size.height - 540) / 6,
                        ),
                      ]),
                    ),
                    Container(
                      height: 0.5,
                      margin: const EdgeInsets.symmetric(horizontal: 30.0),
                      color: isLightTheme
                          ? Colors.black.withOpacity(0.2)
                          : Colors.white.withOpacity(0.2),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => const ModifyAnswerDialog(
                                  question: "가장 여행가고 싶은 곳은?",
                                  answer: "아이슬란드",
                                ));
                      },
                      child: Column(children: [
                        SizedBox(
                          height:
                              (MediaQuery.of(context).size.height - 540) / 6,
                        ),
                        // const Expanded(child: SizedBox()),
                        Text(
                          "Q. 가장 여행가고 싶은 곳은?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: isLightTheme ? Colors.black : Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const SizedBox(
                          height: 34,
                        ),
                        Text.rich(TextSpan(children: [
                          TextSpan(
                            text: "A. ",
                            style: TextStyle(
                              color: isLightTheme ? Colors.black : Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          TextSpan(
                            text: "아이슬란드",
                            style: TextStyle(
                              color: isLightTheme ? Colors.black : Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ])),
                      ]),
                    )
                  ],
                ),
              if (!isDragUp)
                Column(
                  children: [
                    Text("Q. 오늘 날씨가 어때요?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: isLightTheme ? Colors.black : Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        )),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Text("Q. 가장 최근에 본 영화는?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: isLightTheme ? Colors.black : Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        )),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Text("Q. 가장 여행 가고 싶은 곳은?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: isLightTheme ? Colors.black : Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        )),
                  ],
                )
            ],
          ),
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    DateTime now = DateTime.now();
    selectedDay = now.day;
    setDateList(now.year, now.month);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var themeMode = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      body: Center(
          child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: themeMode.themeNotifier == ThemeMode.light
                ? const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/background_img.png"))
                : null,
            gradient: themeMode.themeNotifier == ThemeMode.dark
                ? const LinearGradient(
                    begin: Alignment(0.00, -1.00),
                    end: Alignment(0, 1),
                    colors: [Color(0xFF517FCF), Color(0xFFE5E1BB)])
                : null),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0, bottom: 8.0, left: 40),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (isDragUp) {
                        isDragUp = false;
                        setState(() {});
                      } else {
                        Navigator.of(context).pop();
                      }
                    },
                    child: Image.asset(
                      "assets/back_arrow.png",
                      width: 20,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            if (!isDragUp) CalendarWidget(themeMode.themeNotifier),
            const SizedBox(
              height: 28,
            ),
            Expanded(child: CalendarDetailWidget(themeMode.themeNotifier)),
          ],
        ),
      )),
    );
  }
}
