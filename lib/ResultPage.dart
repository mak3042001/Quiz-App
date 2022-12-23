import 'package:flutter/material.dart';
import 'package:quiz_app/constColor.dart';
import 'package:quiz_app/playQuizApp.dart';

class ResultPage extends StatelessWidget {
  final int correctAnswer, wrongAnswer;

  const ResultPage(
      {Key? key, required this.correctAnswer, required this.wrongAnswer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: foregroundColor,
        title: const Text(
          "Result",
          style: TextStyle(
            color: backgroundColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                answerTap(
                  title: "Correct Answer",
                  num: correctAnswer,
                ),
                answerTap(
                  title: "Wrong Answer",
                  num: wrongAnswer,
                ),
              ],
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: foregroundColor,
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PlayQuizApp()),
                    (route) => false,
                  );
                },
                child: const Text(
                  "Restart",
                  style: TextStyle(
                    color: backgroundColor,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

Widget answerTap({required String title, required int num}) {
  return Column(
    children: [
      Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      Text(
        "$num",
        style: const TextStyle(
          color: foregroundColor,
          fontSize: 60,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}
