import 'package:flutter/material.dart';

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

  Widget CalendarWidget() {
    return Opacity(
      opacity: 0.90,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 36),
        height: 380,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(17)),
            color: Colors.white),
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
                        setDateList(year, month - 1);
                      },
                      child: Image.asset(
                        "assets/calendar_back_arrow.png",
                        width: 16,
                      )),
                  const Expanded(child: SizedBox()),
                  Text(
                    "${year.toString()}년 ${month.toString()}월",
                    style: const TextStyle(
                      color: Color(0xFF4A5660),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  GestureDetector(
                      onTap: () {
                        setDateList(year, month + 1);
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
                                          ? const Color(0xFFFFCE71)
                                          : null),
                                  child: Text(
                                    dateList[e] == -1
                                        ? ""
                                        : dateList[e].toString(),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.black,
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

  Widget CalendarDetailWidget() {
    return Opacity(
        opacity: 0.90,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 36),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(17), topRight: Radius.circular(17)),
              color: Colors.white),
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
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                              color: Color(0xFF000000)),
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
                    color: Colors.black.withOpacity(0.7),
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
                color: Colors.black.withOpacity(0.2),
              ),
              if (!isDragUp)
                const SizedBox(
                  height: 24.0,
                ),
              if (isDragUp)
                Column(
                  children: [
                    SizedBox(
                      height: (MediaQuery.of(context).size.height - 540) / 6,
                    ),
                    const Text(
                      "Q. 오늘은 누구를 만나셨나요?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(
                      height: 34,
                    ),
                    const Text.rich(TextSpan(children: [
                      TextSpan(
                        text: "A. ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      TextSpan(
                        text: "지수와 예희",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ])),
                    SizedBox(
                      height: (MediaQuery.of(context).size.height - 540) / 6,
                    ),
                    // const Expanded(child: SizedBox()),
                    Container(
                      height: 0.5,
                      margin: const EdgeInsets.symmetric(horizontal: 30.0),
                      color: Colors.black.withOpacity(0.2),
                    ),
                    SizedBox(
                      height: (MediaQuery.of(context).size.height - 540) / 6,
                    ),
                    // const Expanded(child: SizedBox()),
                    const Text(
                      "Q. 아침에 무엇을 드셨나요?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(
                      height: 34,
                    ),
                    const Text.rich(TextSpan(children: [
                      TextSpan(
                        text: "A. ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      TextSpan(
                        text: "오이냉국",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ])),
                    SizedBox(
                      height: (MediaQuery.of(context).size.height - 540) / 6,
                    ),
                    // const Expanded(child: SizedBox()),
                    Container(
                      height: 0.5,
                      margin: const EdgeInsets.symmetric(horizontal: 30.0),
                      color: Colors.black.withOpacity(0.2),
                    ),
                    SizedBox(
                      height: (MediaQuery.of(context).size.height - 540) / 6,
                    ),
                    // const Expanded(child: SizedBox()),
                    const Text(
                      "Q. 가장 여행가고 싶은 곳은?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(
                      height: 34,
                    ),
                    const Text.rich(TextSpan(children: [
                      TextSpan(
                        text: "A. ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      TextSpan(
                        text: "아이슬란드",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ])),
                  ],
                ),
              if (!isDragUp)
                const Column(
                  children: [
                    Text("Q. 오늘 날씨가 어때요?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        )),
                    SizedBox(
                      height: 24.0,
                    ),
                    Text("Q. 가장 최근에 본 영화는?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        )),
                    SizedBox(
                      height: 24.0,
                    ),
                    Text("Q. 가장 여행 가고 싶은 곳은?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
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
    return Scaffold(
      body: Center(
          child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/background_img.png"))),
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
                      Navigator.of(context).pop();
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
            if (!isDragUp) CalendarWidget(),
            const SizedBox(
              height: 28,
            ),
            Expanded(child: CalendarDetailWidget()),
          ],
        ),
      )),
    );
  }
}
