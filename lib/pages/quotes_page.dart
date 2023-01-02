import 'package:flutter/material.dart';
import 'package:sciencenotes/assets/colors/custom_colors.dart';
import 'package:sciencenotes/api/quotes_api.dart';

class QuotesPage extends StatefulWidget {
  const QuotesPage({Key? key}) : super(key: key);

  @override
  State<QuotesPage> createState() => _QuotesPageState();
}

String quote = '';

class _QuotesPageState extends State<QuotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Science Notes',
          style: TextStyle(
              fontSize: 24,
              color: CustomColors.white,
              fontFamily: 'Staatliches'),
        ),
        backgroundColor: CustomColors.appeButtonColor,
      ),
      body: Container(
        color: Colors.purple[200],
        child: Padding(
          padding: EdgeInsets.all(16),
          child:  Column(
            children: [
              Text(
                "QUOTES",
                style: TextStyle(fontSize: 46, color: CustomColors.appeButtonColor, fontFamily: 'Staatliches')
              ),
              const SizedBox(height: 32),
              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.white,
                width: 400.0,
                height: 400.0,
                child: Text(quote,
                style: TextStyle(fontSize: 32,color: Color.fromARGB(255, 0, 0, 0),  fontFamily: 'Abel-Regular')),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: onPressedButton,
                style: ElevatedButton.styleFrom(
                  primary: CustomColors.appeButtonColor,
                  minimumSize: (const Size(170, 40)),
                ),
                child: const Text(
                  'Gerar',
                  style: TextStyle(
                    fontSize: 32,
                    color: CustomColors.white,
                    fontFamily: 'AmaticSC-Regular',
                  ),
                ),
              ),
            ],
            
        ),
        ),
      ),
    );
  }

void frase() async{
  quote = await QuotesApi().Quote();
}

void onPressedButton(){
  frase();
}

}