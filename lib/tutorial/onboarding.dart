import 'package:flutter/material.dart';
import 'package:application_3q3min/home/home_screen.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/background_img.png'),
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
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 4 * 3,
                      width: MediaQuery.of(context).size.width,
                      child: PageView(
                        controller: PageController(),
                        children: const [
                          DayView(
                            date: "2023. 06. 15.",
                          ),
                          DayView(
                            date: "2023. 06. 16.",
                          ),
                          DayView(
                            date: "2023. 06. 17.",
                          ),
                          DayView(
                            date: "2023. 06. 18.",
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 300,
                      margin: const EdgeInsets.fromLTRB(0, 35, 0, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            alignment: Alignment.center,
                            child: const Image(
                              image: AssetImage('assets/setting_button.png'),
                              color: Colors.lightBlue,
                            ),
                          ),
                          const SizedBox(
                            width: 90,
                            height: 90,
                            child: Image(
                              image: AssetImage('assets/home_button.png'),
                            ),
                          ),
                          Container(
                              width: 50,
                              height: 50,
                              alignment: Alignment.center,
                              child: const Image(
                                image: AssetImage('assets/calendar_button.png'),
                                color: Colors.lightBlue,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const FadeSwitcher(),
      ],
    );
  }
}

class FadeSwitcher extends StatefulWidget {
  const FadeSwitcher({super.key});

  @override
  State<FadeSwitcher> createState() => _FadeSwitcherState();
}

class _FadeSwitcherState extends State<FadeSwitcher> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
      child: GestureDetector(
        onTap: _nextWidget,
        child: Stack(
          alignment: Alignment.center,
          children: [
            _buildAnimatedWidget(0, _page0()),
            _buildAnimatedWidget(1, _page1()),
            _buildAnimatedWidget(2, _page2()),
            _buildAnimatedWidget(3, _page3()),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedWidget(int index, Widget page) {
    return AnimatedOpacity(opacity: _currentIndex == index ? 1 : 0,
        duration: const Duration(seconds: 1),
      child: page,
    );
  }

  Widget _page0() {
    return const Center(
      child: Image(
        image: AssetImage('assets/touch.png'),
      ),
    );
  }

  Widget _page1() {
    return const Column(
      children: [
        Text(
          '질문 박스를 터치하면\n질문에 대한 답변을 작성할 수 있습니다.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontFamily: 'Helvetica Neue',
            fontWeight: FontWeight.w700,
            letterSpacing: 0.85,
          ),
        ),
        Image(image: AssetImage('assets/bar.png')),
        // 세번째 질문 박스만 하이라이트 하기 추가해야 함
      ],
    );
  }

  Widget _page2() {
    return const Column(
      children: [
        Text(
          '3Q3Min 로고를 터치하면\n오늘 기록으로 이동합니다.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontFamily: 'Helvetica Neue',
            fontWeight: FontWeight.w700,
            letterSpacing: 0.85,
          ),
        ),
        Image(image: AssetImage('assets/bar.png')),
        SizedBox(
          width: 90,
          height: 90,
          child: Image(
            image: AssetImage('assets/home_button.png'),
          ),
        ),
      ],
    );
  }

  Widget _page3() {
    return const Column(
      children: [
        Text(
          '좌우 스크롤을 통해\n다른 날짜의 기록을 확인할 수 있습니다.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontFamily: 'Helvetica Neue',
            fontWeight: FontWeight.w700,
            letterSpacing: 0.85,
          ),
        ),
        Image(image: AssetImage('assets/slide.png')),
      ],
    );
  }

  void _nextWidget() {
    setState(() {
      _currentIndex++;
      if (_currentIndex >= 4) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const HomeScreen()),
                (route) => false);
      }
    });
  }
}
