import 'package:flutter/material.dart';
import 'package:sciencenotes/assets/colors/custom_colors.dart';
import 'package:sciencenotes/data/content_dao.dart';
import 'package:sciencenotes/widgets/content_card.dart';
import 'package:sciencenotes/domain/content.dart';

class PhysicalPage extends StatefulWidget {
  const PhysicalPage({Key? key}) : super(key: key);

  @override
  State<PhysicalPage> createState() => _PhysicalPageState();
}

class _PhysicalPageState extends State<PhysicalPage> {

  //Future<List<Content>> list = DBcontent.getListPhysical();

  Future<List<Content>> list = ContentDao().listContentPhysical();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.appeButtonColor,
        centerTitle: false,
        title: const Text(
          'Física',
          style: TextStyle(fontSize: 24,color: CustomColors.white, fontFamily: 'Staatliches'),
        ),
      ),
      backgroundColor: CustomColors.chemistryColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: CustomColors.chemistryColor,
          child: ListView(
            children: [
              buildListView(),
            ],
          ),
        ),
      ),
    );
  }

  buildListView() {
    return FutureBuilder<List<Content>>(
      future: list,
      builder: (context, snapshot) {

        if(snapshot.hasData) {
          // ?? -> Verificar ser o conteudo de snapshot.data é nulo
          List<Content> list = snapshot.data ?? [];

          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return ContentCard(content: list[index]);
            },
          );
        }

        return const Center(child: CircularProgressIndicator());

      },
    );
  }
}