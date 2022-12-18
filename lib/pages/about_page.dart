import 'package:flutter/material.dart';
import 'package:sciencenotes/assets/colors/custom_colors.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sobre o app',
          style: TextStyle(
              fontSize: 24, color: CustomColors.white,  fontFamily: 'Staatliches'),
        ),
        backgroundColor: CustomColors.appeButtonColor,
      ),
      body: Container(
        color: CustomColors.gradienColor,
        child: const Center(
          child: Text('PÁGINA INDISPONÍVEL'),
        ),
      ),
    );
  }
}
