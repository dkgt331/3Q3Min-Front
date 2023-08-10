import 'package:application_3q3min/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loginSuccess = false;

  Future<void> googleLogin() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // backend에 보내주기
    print(googleAuth.accessToken);
    print(googleAuth.idToken);

    setState(() {
      loginSuccess = true;
    });

    if (loginSuccess) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (route) => false);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(flex: 2, child: SizedBox()),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 50.0),
                height: 400,
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, color: Colors.white.withOpacity(0.7)),
                  borderRadius: const BorderRadius.all(Radius.circular(17)),
                  color: const Color(0x6688B3F2),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x33000000),
                      blurRadius: 2,
                      offset: Offset(0, 2),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    const Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          "안녕하세요",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Helvetica Neue',
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ],
                    ),
                    const Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Text.rich(TextSpan(children: [
                          TextSpan(
                            text: "3Q3Min",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 29,
                              fontFamily: 'Helvetica Neue',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: " 입니다.",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Helvetica Neue',
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ]))
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          '나만의 기록, 지금부터 만들어봐요!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontFamily: 'Helvetica',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    GestureDetector(
                      onTap: () {
                        googleLogin();
                      },
                      child: Container(
                        height: 46,
                        width: 204,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.95),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(14)),
                            border:
                                Border.all(color: Colors.white, width: 0.5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/google_login.png",
                              width: 20,
                            ),
                            const SizedBox(
                              width: 18,
                            ),
                            Image.asset(
                              "assets/google_login_text.png",
                              height: 14,
                            ),
                            const Text(
                              " 계정으로 가입",
                              style: TextStyle(
                                color: Color(0xFF888E9D),
                                fontSize: 10,
                                fontFamily: 'Helvetica Neue',
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    Text("혹시 계정을 잊어버리셨나요?",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 11,
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w300,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                        )),
                    const SizedBox(
                      height: 36,
                    )
                  ],
                ),
              ),
              Expanded(
                  flex: 3,
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/home_button.png",
                          width: 92,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "3Q3Min",
                          style: TextStyle(
                            color: Color(0xFFFFF071),
                            fontSize: 24,
                            fontFamily: 'Helvetica Neue',
                            fontWeight: FontWeight.w700,
                            letterSpacing: 2.40,
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
