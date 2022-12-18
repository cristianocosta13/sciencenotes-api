import 'package:flutter/material.dart';
import 'package:sciencenotes/api/user_api.dart';
import 'package:sciencenotes/domain/users.dart';
import 'package:sciencenotes/widgets/list_profile.dart';

class ProfilePage extends StatefulWidget{
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}
class _ProfilePageState extends State<ProfilePage>{
  Future<List<Users>> list = UserApi().listUsers();

  @override
  Widget build(BuildContext context){
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
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
                return ListProfile(user: list[index]);
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        }
    );
  }
}
