import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/main.dart';
import 'package:quiz/start_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswers});

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }
    return summary;
  }

  final List<String> chosenAnswers;
  @override
  Widget build(BuildContext context) {
    final summary = getSummaryData();
    var answer = 0;
    for(var i = 0; i< summary.length; i++)
    {
      if(summary[i]['correct_answer'] == summary[i]['user_answer'] )
        answer++;
    }
    
    return SizedBox(
      height: double.infinity,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
              Text(
                "You answered:" + answer.toString() + " out of 6 correctly",
                style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 215, 161, 231),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            const SizedBox(
              height: 30,
            ),
            for (var element in summary)
              Column(
                children: [
                  Text(
                    'Question: ' + element['question'].toString(),
                    style: GoogleFonts.lato(
                        color: const Color.fromARGB(255, 215, 161, 231),
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Correct answer: ' + element['correct_answer'].toString(),
                    style: GoogleFonts.lato(
                        color: const Color.fromARGB(255, 215, 161, 231),
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Text('Your answer: ' + element['user_answer'].toString(),
                                      style: GoogleFonts.lato(
                        color: const Color.fromARGB(255, 215, 161, 231),
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
                          TextButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Quiz()),
              );
            }, 
            child: const Text('Restart quiz')),
          ]),
    );
  }
}