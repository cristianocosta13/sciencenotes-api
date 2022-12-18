import 'package:sciencenotes/domain/resume.dart';
import 'package:sciencenotes/pages/addResume.dart';
import 'package:sciencenotes/data/resume_dao.dart';
import 'package:sciencenotes/domain/content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../assets/colors/custom_colors.dart';
import '../widgets/resume_card.dart';

class ResumePage extends StatefulWidget {
  final Content content;

  const ResumePage({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  State<ResumePage> createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage> {
  var list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 216, 194, 225),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [buildListView()],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const AddResume();
              },
            ),
          );
          const Divider(
              height: 30,
              thickness: 5,
              indent: 20,
              endIndent: 0,
              color: Colors.black);
        },
        child: const Icon(CupertinoIcons.add),
        backgroundColor: Color(widget.content.colorButton),
      ),
    );
  }

  buildListView() {
    list = ResumeDao().selectDiscipline(widget.content);
    return FutureBuilder<List<Resume>>(
      future: list,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // ?? -> Verificar ser o conteudo de snapshot.data é nulo
          List<Resume> list = snapshot.data ?? [];

          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return ResumeCard(resume: list[index]);
            },
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
