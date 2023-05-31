import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget{
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          color: const Color.fromARGB(96, 255, 255, 255),
          width: 300,
        ),
        const SizedBox(
          height: 80,
        ),
        const Center(
          child: Text('Learning Flutter!',
              style: TextStyle(color: Colors.white, fontSize: 24)),
        ),
        const SizedBox(
          height: 80,
        ),
        OutlinedButton.icon(
            icon: const Icon(Icons.arrow_right_alt),
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            label: const Text('Start quiz'))
      ]),
    );
  }
}