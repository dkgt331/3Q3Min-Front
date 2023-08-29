import 'package:flutter/material.dart';

class ModifyAnswerDialog extends StatefulWidget {
  final question;
  final answer;

  const ModifyAnswerDialog(
      {Key? key, required this.question, required this.answer})
      : super(key: key);

  @override
  State<ModifyAnswerDialog> createState() => _ModifyAnswerDialogState();
}

class _ModifyAnswerDialogState extends State<ModifyAnswerDialog> {
  final _controller = TextEditingController();
  var _userAnswer = "";

  @override
  void initState() {
    // TODO: implement initState
    _controller.text = widget.answer;
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Align(
        alignment: Alignment.center,
        child: Opacity(
          opacity: 0.90,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 48.0),
            height: 160,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(17)),
                color: Colors.white),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 12.0, bottom: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "10:00 AM",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontSize: 16,
                          fontFamily: 'Helvetica Neue',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.80,
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Image.asset(
                          "assets/answer_modify_check.png",
                          width: 18,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 18.0),
                  height: 0.5,
                  color: Colors.black.withOpacity(0.2),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Q. ${widget.question}",
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontSize: 16,
                    fontFamily: 'Helvetica Neue',
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.80,
                  ),
                ),
                const SizedBox(
                  height: 14.0,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 28.0),
                  height: 40.0,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color(0xFF9D9D9D)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 18.0),
                    child: TextField(
                      maxLines: 1,
                      cursorColor: Colors.black,
                      controller: _controller,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                          isDense: true),
                      onChanged: (value) {
                        setState(() {
                          _userAnswer = value;
                        });
                      },
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.85),
                        fontSize: 16,
                        fontFamily: 'Helvetica Neue',
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.80,
                      ),
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
