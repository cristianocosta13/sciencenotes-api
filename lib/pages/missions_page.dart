import 'package:flutter/material.dart';
import 'package:sciencenotes/assets/colors/custom_colors.dart';
import 'package:sciencenotes/widgets/missions_card.dart';

class listMissionsPage extends StatefulWidget {
  const listMissionsPage({Key? key}) : super(key: key);

  @override
  _listMissionsPageState createState() => _listMissionsPageState();
}

class _listMissionsPageState extends State<listMissionsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: CustomColors.appeButtonColor,
        title: const Text(
          'Science Notes',
          style: TextStyle(fontSize: 24, color: CustomColors.white, fontFamily: 'Staatliches'),
        ),
      ),
      backgroundColor: CustomColors.gradienColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: buildListView(),
      ),
    );
  }

  buildListView(){
    return ListView(
      children: [
        Mission(title: "Constância", description: "Estude 3 horas todos os dias ao longo da semana.", icon: Icons.access_time),
        Mission(title: "Pratique", description: "Faça 20 questões por dia.", icon: Icons.assignment_rounded),
        Mission(title: "Flashcards", description: "Faça flashcards dos assuntos que está estudando.", icon: Icons.drive_file_move_outline),
        Mission(title: "Planner", description: "Organize suas tarefas diárias.", icon: Icons.calendar_month),
        Mission(title: "Simulados", description: "Faça simulados interdiscuplinares com frequência e treine tudo o que aprendeu.", icon: Icons.text_increase_sharp),
      ],
    );
  }
}