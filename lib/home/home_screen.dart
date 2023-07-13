import 'package:application_3q3min/calendar/calendar_screen.dart';
import 'package:application_3q3min/setting/setting_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/background1.png'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 180,
                height: 44,
                decoration: BoxDecoration(
                  color: Color(0xff644312).withOpacity(0.4),
                  borderRadius: BorderRadius.circular(40),
                ),
                margin: EdgeInsets.all(5),
                alignment: Alignment.center,
                child: Text(
                  "2023. 06. 17.",
                ),
              ),
              Container(
                height: 150,
                width: 300,
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("10:00 AM"),
                    Text("Q. 아침에 무엇을 드셨나요?"),
                    Text("A. 오이냉국"),
                  
                  ],
                ),
              ),
              Container(
                height: 150,
                width: 300,
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("10:00 AM"),
                    Text("Q. 아침에 무엇을 드셨나요?"),
                    Text("A. 오이냉국"),
                  
                  ],
                ),
              ),
              Container(
                height: 150,
                width: 300,
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("10:00 AM"),
                    Text("Q. 아침에 무엇을 드셨나요?"),
                    Text("A. 오이냉국"),
                  
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SettingScreen(),
                    ),
                  );
                },
                child: Container(
                  width: 200,
                  height: 30,
                  alignment: Alignment.center,
                  color: Colors.purple,
                  child: const Text(
                    "설정으로 이동",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
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
                  width: 200,
                  height: 30,
                  alignment: Alignment.center,
                  color: Colors.purple,
                  child: const Text(
                    "캘린더로 이동",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
            ),  
          ),
        ),
      ),
    );
  }
}
