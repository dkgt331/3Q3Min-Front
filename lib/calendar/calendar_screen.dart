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

  void setDateList(int setYear, int setMonth) {
    year = setYear;
    month = setMonth;

    final firstDayOfMonth = DateTime(year, month, 1);
    final firstDay = firstDayOfMonth.weekday - 1;
    final lastDate = DateTime(year, month + 1, 0).day;

    dateList = ["월", "화", "수", "목", "금", "토", "일"];

    for (int i = 0; i < firstDay; i++) {
      dateList.add("empty");
    }

    for (int i = 1; i <= lastDate; i++) {
      dateList.add(i.toString());
    }

    setState(() {});
  }

  Widget CalendarWidget() {
    return Opacity(
      opacity: 0.90,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 36),
        height: 360,
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
                    child: Container(
                      width: 16,
                      height: 16,
                      color: Colors.amber,
                    ),
                  ),
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
                    child: Container(
                      width: 16,
                      height: 16,
                      color: Colors.amber,
                    ),
                  )
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
                        .map((e) => SizedBox(
                            width: 38,
                            height: 38,
                            child: Text(
                              dateList[e] == "empty" ? "" : dateList[e],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            )))
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

  @override
  void initState() {
    // TODO: implement initState
    DateTime now = DateTime.now();
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
        color: Colors.blue,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    color: Colors.purple,
                  ),
                ],
              ),
            ),
            CalendarWidget()
          ],
        ),
      )),
    );
  }
}
