import 'package:sciencenotes/domain/users.dart';
import 'package:flutter/material.dart';
import 'package:sciencenotes/assets/colors/custom_colors.dart';
import 'package:sciencenotes/widgets/list_folks.dart';

import '../api/user_api.dart';

class listPeoplePage extends StatefulWidget {
  const listPeoplePage({Key? key}) : super(key: key);

  @override
  _listPeoplePageState createState() => _listPeoplePageState();
}

class _listPeoplePageState extends State<listPeoplePage> {
  Future<List<Users>> list = UserApi().listUsers();

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
    return FutureBuilder<List<Users>>(
        future: list,
        builder: (context, snapshot){
          if(snapshot.hasData){
            List<Users> list = snapshot.data ?? [];
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index){
                return ListFolks(user: list[index]);
              },
            );
          }
          return Center(child: const CircularProgressIndicator());
        }
    );
  }
}