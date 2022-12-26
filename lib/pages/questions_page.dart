import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sciencenotes/assets/colors/custom_colors.dart';
import 'package:sciencenotes/data/question_dao.dart';
import 'package:sciencenotes/domain/content.dart';
import 'package:sciencenotes/domain/question.dart';
import 'package:sciencenotes/pages/addQuestion.dart';
import 'package:sciencenotes/widgets/question_card.dart';

class QuestionsPage extends StatefulWidget {
  final Content content;

  const QuestionsPage({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {

  var list;

  @override
  void initState() {
    super.initState();
    setState(() {
      list = QuestionDao().selectDiscipline(widget.content);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.gradienColor,
      body: ListView(
        children: [
          buildListView(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const AddQuestion();
              },
            ),
          );
        },
        child: const Icon(CupertinoIcons.add),
        backgroundColor: Color(widget.content.colorButton),
      ),
    );
  }

  buildListView() {
    setState(() {
      list = QuestionDao().selectDiscipline(widget.content);
    });
    return FutureBuilder<List<Question>>(
      future: list,
      builder: (context, snapshot) {

        if(snapshot.hasData) {
          // ?? -> Verificar ser o conteudo de snapshot.data é nulo
          List<Question> list = snapshot.data ?? [];

          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return QuestionCard(question: list[index]);
            },
          );
        }

        return const Center(child: CircularProgressIndicator());

      },
    );
  }
}