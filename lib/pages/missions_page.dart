import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sciencenotes/api/mission_api.dart';
import 'package:sciencenotes/assets/colors/custom_colors.dart';
import 'package:sciencenotes/domain/mission.dart';
import 'package:sciencenotes/pages/addMission_page.dart';
import 'package:sciencenotes/widgets/missions_card.dart';

class listMissionsPage extends StatefulWidget {
  const listMissionsPage({Key? key}) : super(key: key);

  @override
  _listMissionsPageState createState() => _listMissionsPageState();
}

class _listMissionsPageState extends State<listMissionsPage> {
  Future<List<Mission>> list = MissionApi().listMissions();

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
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const AddMission();
              },
            ),
          );
        },
        child: const Icon(CupertinoIcons.add),
        backgroundColor: CustomColors.appeButtonColor,
      ),
    );
  }

  buildListView() {
    return FutureBuilder<List<Mission>>(
        future: list,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Mission> list = snapshot.data ?? [];
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return MissionWidget(mission: list[index]);
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
