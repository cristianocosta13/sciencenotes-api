import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:sciencenotes/domain/flashcard.dart';
import 'package:sciencenotes/pages/flashcard_view.dart';
import 'package:sciencenotes/assets/colors/custom_colors.dart';
//import 'package:sciencenotes/pages/flashcard.dart';

class FlashcardsPage extends StatefulWidget {
  const FlashcardsPage({Key? key}) : super(key: key);

  @override
  State<FlashcardsPage> createState() => _FlashcardsPageState();
}

class _FlashcardsPageState extends State<FlashcardsPage> {
  List<Flashcard> _flashcardBs = [
    Flashcard(question: "O que é uma célula?", answer: "Unidades funcionais e estruturais dos seres vivos"),
    Flashcard(question: "Qual animal tem listras?", answer: "Zebra"),
  ];
  int _currenIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flashcards',
          style: TextStyle(
              fontSize: 24,
              color: CustomColors.white,
              fontFamily: 'Staatliches'),
        ),
        backgroundColor: CustomColors.appeButtonColor,
      ),
      backgroundColor: CustomColors.gradienColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 250,
                height: 250,
                child: FlipCard(
                    front: FlashcardView(
                      text: _flashcardBs[_currenIndex].question,
                    ),
                    back: FlashcardView(
                      text: _flashcardBs[_currenIndex].answer,
                    ))),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton.icon(
                    onPressed: showPreviousCard,
                    icon: Icon(Icons.chevron_left),
                    label: Text('Prev')),
                OutlinedButton.icon(
                    onPressed: showNextCard,
                    icon: Icon(Icons.chevron_right),
                    label: Text('Next')),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showNextCard() {
    setState(() {
      (_currenIndex + 1 < _flashcardBs.length) ? _currenIndex + 1 : 0;
    });
  }

  void showPreviousCard() {
    setState(() {
      (_currenIndex - 1 < _flashcardBs.length) ? _currenIndex - 1 : 0;
    });
  }
}
