import 'package:application_3q3min/calendar/calendar_screen.dart';
import 'package:application_3q3min/setting/setting_screen.dart';
import 'package:flutter/material.dart';

class QnaBox extends StatelessWidget {
  final String time;
  final String question;
  final String answer;

  const QnaBox({Key? key, required this.time, required this.question, required this.answer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 300,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 280,
            margin: const EdgeInsets.fromLTRB(10, 3, 10, 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 245,
                      child: Text(
                        time,
                        style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Helvetica Neue',
                        fontWeight: FontWeight.w300,
                        letterSpacing: 0.80,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.edit,
                      color: Colors.grey,
                      size: 20,
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black.withOpacity(0.2))),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            width: 280,
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Q. $question",
                  style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Helvetica Neue',
                  fontWeight: FontWeight.w300,
                  letterSpacing: 0.80,
                  ),
                ),
                Text(
                  "A. $answer",
                  style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Helvetica Neue',
                  fontWeight: FontWeight.w300,
                  letterSpacing: 0.80,
                  ),  
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/background1.png'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 180,
                height: 44,
                decoration: BoxDecoration(
                  color: const Color(0xff644312).withOpacity(0.4),
                  borderRadius: BorderRadius.circular(40),
                ),
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                alignment: Alignment.center,
                child: const Text(
                  "2023. 06. 17.",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const QnaBox(time: "10:00 AM", question: "아침에 무엇을 드셨나요?", answer: "오이냉국",),
              const QnaBox(time: "03:00 PM", question: "오늘은 누구를 만나셨나요?", answer: "지수랑 예희",),
              Container(
                height: 150,
                width: 300,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "10:00 AM",
                            style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Helvetica Neue',
                            fontWeight: FontWeight.w300,
                            letterSpacing: 0.80,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: Colors.black.withOpacity(0.2))),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 200,
                            height: 30,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              "?",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            width: 200,
                            height: 30,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20)
                              ),
                            child: const Text(
                              "?",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 260,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SettingScreen(),
                          ),
                        );
                      },
                      child: Container(
                        width: 45,
                        height: 45,
                        alignment: Alignment.center,
                        child: Image(
                          image: AssetImage('assets/setting_button.png'),
                          color: Colors.lightBlue,
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 45,
                      height: 45,
                      child: Image(
                        image: AssetImage('assets/home_button.png'),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const CalendarScreen(),
                          ),
                        );
                      },
                      child: Container(
                        width: 45,
                        height: 45,
                        alignment: Alignment.center,
                        child: Image(
                          image:AssetImage('assets/calendar_button.png'),
                          color: Colors.lightBlue,
                          width: 40,
                          height: 40,
                        )
                      ),
                    )
                  ],
                ),
              ),
            ],
            ),  
          ),
        ),
      ),
    );
  }
}
