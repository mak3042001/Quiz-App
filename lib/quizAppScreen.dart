import 'package:flutter/material.dart';
import 'package:quiz_app/constColor.dart';
import 'package:quiz_app/playQuizApp.dart';

class QuizAppScreen extends StatelessWidget {
  const QuizAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: backgroundColor,
      appBar:  AppBar(
        backgroundColor: foregroundColor,
        title: const Text("Start Quiz",style: TextStyle(
          color: backgroundColor,
          fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text("Quiz App",style: TextStyle(
              color: foregroundColor,
              fontSize: 45,
              fontWeight: FontWeight.w500,
            ),),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: foregroundColor,
              ),
                onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const PlayQuizApp()));
                },
                child: const Text("Start Quiz", style: TextStyle(
                  color: backgroundColor,
            ),)),
          ],
        ),
      ),
    );
  }
}
