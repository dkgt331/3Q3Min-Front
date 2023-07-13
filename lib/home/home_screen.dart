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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
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
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Q. 오늘은 누구를 만나셨나요?",
                            style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Helvetica Neue',
                            fontWeight: FontWeight.w300,
                            letterSpacing: 0.80,
                            ),
                          ),
                          Text(
                            "A. 지수랑 예희",
                            style: TextStyle(
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
                    Text(
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
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Q. 오늘은 누구를 만나셨나요?",
                            style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Helvetica Neue',
                            fontWeight: FontWeight.w300,
                            letterSpacing: 0.80,
                            ),
                          ),
                          Text(
                            "A. 지수랑 예희",
                            style: TextStyle(
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
                    Text(
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
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 180,
                            height: 30,
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "?",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            width: 180,
                            height: 30,
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10)
                              ),
                            child: Text(
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
