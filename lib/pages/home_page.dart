import 'package:flutter/material.dart';
import 'package:sciencenotes/pages/biology_page.dart';
import 'package:sciencenotes/assets/colors/custom_colors.dart';
import 'package:sciencenotes/widgets/science_card.dart';
import 'package:sciencenotes/pages/physical_page.dart';
import 'package:sciencenotes/pages/chemical_page.dart';
import 'package:sciencenotes/data/shared_prefs_helper.dart';
import 'package:sciencenotes/pages/enter_page.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState(){
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: CustomColors.appeButtonColor,
        actions: [
          IconButton(
            onPressed: () {
              SharedPrefsHelper().logout();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const EnterPage();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.logout_sharp,
              color: Colors.white,
            ),
          ),
        ],
        title: const Text(
          'Sciences Notes',
          style: TextStyle(fontSize: 24, color: CustomColors.white,  fontFamily: 'Staatliches'),
        ),
      ),
      backgroundColor: CustomColors.gradienColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            ScienceCard(
              colorButton: CustomColors.phisicsColor,
              colorCard: CustomColors.phisicsColor,
              scienceName: 'Física',
              scienceImage: 'lib/assets/images/fisica.png',
              directionPage: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const PhysicalPage();
                    },
                  ),
                );
              },
            ),
            ScienceCard(
              colorButton: CustomColors.chemistryColor,
              colorCard: CustomColors.chemistryColor,
              scienceName: 'Química',
              scienceImage: 'lib/assets/images/quimica.png',
              directionPage: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const ChemicalPage();
                    },
                  ),
                );
              },
            ),
            ScienceCard(
              colorButton: CustomColors.biologyColor,
              colorCard: CustomColors.biologyColor,
              scienceName: 'Biologia',
              scienceImage: 'lib/assets/images/biologia.png',
              directionPage: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const BiologyPage();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

}