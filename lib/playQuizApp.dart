import 'package:flutter/material.dart';
import 'package:quiz_app/ResultPage.dart';
import 'package:quiz_app/constColor.dart';
import 'package:quiz_app/constModelQuestion.dart';
import 'package:quiz_app/questionQuizModel.dart';

class PlayQuizApp extends StatefulWidget {
  const PlayQuizApp({Key? key}) : super(key: key);

  @override
  State<PlayQuizApp> createState() => _PlayQuizAppState();
}

class _PlayQuizAppState extends State<PlayQuizApp> {
  PageController pageController = PageController();
  bool isLocked = false;
  String selected = "" , correctAnswer = "";
  int currentIndex = 0 , correctAnswers = 0 , wrongAnswers = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: foregroundColor,
        title: const Text(
          "Start Quiz",
          style: TextStyle(
            color: backgroundColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        itemCount: questionsQuiz?.length,
        itemBuilder: (context,index) {
          QuestionQuizModel? model = questionsQuiz![index];
          return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
             Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "${model?.question}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Column(
                children: List.generate(
                  model!.options.length,
                      (index) => InkWell(
                    onTap: () {
                     setState(() {
                       isLocked = true;
                       selected = model.options[index];
                       correctAnswer = model.correctAnswer;
                     });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: foregroundColor,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          color: selected == model.options[index] ? foregroundColor:backgroundColor,
                        ),
                        child: Text(
                          model.options[index],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ))
          ],
        ),
      );}
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          if(isLocked){
            if(selected == correctAnswer){
              correctAnswers++;
            }else{
              wrongAnswers++;
            }
            if(currentIndex != questionsQuiz!.length-1){
            currentIndex++;
            pageController.jumpToPage(currentIndex);
            isLocked=false;
            }else{
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>  ResultPage(correctAnswer: correctAnswers,wrongAnswer: wrongAnswers,)),(route) => false,);
            }
            print("correct answer:$correctAnswers");
            print("wrong answer:$wrongAnswers");
          }else{
            print("please select answer");
          }
        },
        child: Container(
          height: 50.0,
          alignment: Alignment.center,
          color: foregroundColor,
          child: const Text(
            "Next",
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w500,
              color: backgroundColor,
            ),
          ),
        ),
      ),
    );
  }
}
