import 'package:flutter/material.dart';
import 'package:sciencenotes/assets/colors/custom_colors.dart';
import 'package:sciencenotes/domain/toDo.dart';
import 'package:sciencenotes/data/toDo_dao.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {

  List<ToDo> listaAfazeres = [];
  TextEditingController afazerTextController = TextEditingController();
  TextEditingController dataTextController = TextEditingController();
  Future<List<ToDo>> list = ToDoDao().listToDo();

  final _formToDoKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADD AFAZERES',
          style: TextStyle(
              fontSize: 24, color: CustomColors.white,  fontFamily: 'Staatliches'),
        ),
        backgroundColor: CustomColors.appeButtonColor,
      ),
      backgroundColor: CustomColors.gradienColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                const Text('Integre seus afazeres em nosso banco '
                           'e organize melhor sua rotina!'
                  ,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Abel-Regular',
                  ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 24,),
                const Text('ADICIONE SEU AFAZER',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    fontFamily: 'Staatliches',
                  ),
                  textAlign: TextAlign.justify,
                ),
                Form(
                  key: _formToDoKey,
                  child: Column(
                      children: [
                        TextFormField(
                          controller: afazerTextController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo descrição do afazer obrigatório';
                            }
                            return null;
                          },
                          obscureText: false,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.description_outlined, color: CustomColors.appeButtonColor),
                            labelText: 'Descrição',
                            labelStyle: TextStyle(
                              color: CustomColors.textColor,
                              fontFamily: 'Abel-Regular',
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: CustomColors.appeButtonColor,
                              ),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: dataTextController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo data do afazer obrigatório';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            icon: Icon(Icons.date_range_outlined, color: CustomColors.appeButtonColor),
                            labelText: 'Data',
                            labelStyle: TextStyle(
                              color: CustomColors.textColor,
                              fontFamily: 'Abel-Regular',
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: CustomColors.appeButtonColor,
                              ),
                            ),
                          ),
                        ),
                      ]
                  ),
                ),
                const SizedBox(height: 36),
                ElevatedButton(
                  onPressed:onPressedButton,
                  style: ElevatedButton.styleFrom(
                    primary: CustomColors.appeButtonColor,
                    minimumSize: (const Size(120, 40)),
                  ),
                  child: const Text("CRIAR AFAZER",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'AmaticSC-Regular',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onPressedButton() async {
    if (_formToDoKey.currentState!.validate()) {
      String afazerText = afazerTextController.text;
      String dataText = dataTextController.text;

      ToDo afazer1 = ToDo(afazerText: afazerText, dataText: dataText, isDone: 0);
      await ToDoDao().addToDo(afazer: afazer1);
      final msg = SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text('Afazer adicionado ao banco com sucesso!'),
      );
      ScaffoldMessenger.of(context).showSnackBar(msg);
      setState((){
        list = ToDoDao().listToDo();
      });
    }
  }
}
