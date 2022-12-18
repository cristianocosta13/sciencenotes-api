import 'package:flutter/material.dart';
import 'package:sciencenotes/assets/colors/custom_colors.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Estatísticas',
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
