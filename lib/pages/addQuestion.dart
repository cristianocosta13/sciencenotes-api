import 'package:flutter/material.dart';
import 'package:sciencenotes/assets/colors/custom_colors.dart';
import 'package:sciencenotes/data/content_dao.dart';
import 'package:sciencenotes/data/question_dao.dart';
import 'package:sciencenotes/domain/content.dart';
import 'package:sciencenotes/domain/question.dart';

class AddQuestion extends StatefulWidget {
  const AddQuestion({Key? key}) : super(key: key);

  @override
  State<AddQuestion> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {

  TextEditingController disciplineController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController instituteController = TextEditingController();
  TextEditingController questionController = TextEditingController();
  TextEditingController alt1Controller = TextEditingController();
  TextEditingController alt2Controller = TextEditingController();
  TextEditingController alt3Controller = TextEditingController();
  TextEditingController alt4Controller = TextEditingController();
  TextEditingController alt5Controller = TextEditingController();
  TextEditingController alterCorrectController = TextEditingController();

  final _formQuestionKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADD QUESTIONS',
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
                const Text('Agora você pode adicionar questões ao nosso banco de dados! '
                    'Preencha os campos abaixo com as devidas informações e '
                    'implemente novas questões na sua lista de exercícios. '
                    'Integre novas questões em nosso banco, o conhecimento quem faz é você!',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Abel-Regular',
                  ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 24,),
                const Text('ADICIONE SUA QUESTÃO',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    fontFamily: 'Staatliches',
                  ),
                  textAlign: TextAlign.justify,
                ),
                Form(
                  key: _formQuestionKey,
                  child: Column(
                      children: [
                        TextFormField(
                          controller: disciplineController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo Disciplina obrigatório';
                            }
                            return null;
                          },
                          obscureText: false,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.tab_rounded, color: CustomColors.appeButtonColor),
                            labelText: 'Disciplina',
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
                          controller: contentController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo Conteúdo obrigatório';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            icon: Icon(Icons.book_outlined, color: CustomColors.appeButtonColor),
                            labelText: 'Conteúdo',
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
                          controller: instituteController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo Instituto obrigatório';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            icon: Icon(Icons.home, color: CustomColors.appeButtonColor),
                            labelText: 'Instituto',
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
                          controller: questionController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo Questão obrigatório';
                            }
                            return null;
                          },
                          obscureText: false,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.bookmark_add_outlined, color: CustomColors.appeButtonColor),
                            labelText: 'Questão',
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
                          controller: alt1Controller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo Alternativa A obrigatório';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            icon: Icon(Icons.abc_rounded, color: CustomColors.appeButtonColor),
                            labelText: 'Alternativa A',
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
                          controller: alt2Controller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo Alternativa B obrigatório';
                            }
                            return null;
                          },
                          obscureText: false,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.abc_rounded, color: CustomColors.appeButtonColor),
                            labelText: 'Alternativa B',
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
                          controller: alt3Controller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo Alternativa C obrigatório';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            icon: Icon(Icons.abc_rounded, color: CustomColors.appeButtonColor),
                            labelText: 'Alternativa C',
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
                          controller: alt4Controller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo Alternativa D obrigatório';
                            }
                            return null;
                          },
                          obscureText: false,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.abc_rounded, color: CustomColors.appeButtonColor),
                            labelText: 'Alternativa D',
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
                          controller: alt5Controller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo Alternativa E obrigatório';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            icon: Icon(Icons.abc_rounded, color: CustomColors.appeButtonColor),
                            labelText: 'Alternativa E',
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
                          controller: alterCorrectController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo Alternativa Correta obrigatório';
                            }
                            return null;
                          },
                          obscureText: false,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.check_box_outlined, color: CustomColors.appeButtonColor),
                            labelText: 'Alternativa Correta',
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
                const SizedBox(height: 8,),
                const Text('Lembre-se que o campo "Alternativa Correta" deve ser '
                    'preenchido com um valor inteiro de 1 a 5, sendo que cada '
                    'número representa uma letra no sentido A até E.',
                  style: TextStyle(
                    fontFamily: 'Abel-Regular',
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 36),
                ElevatedButton(
                  onPressed:onPressedButton,
                  style: ElevatedButton.styleFrom(
                    primary: CustomColors.appeButtonColor,
                    minimumSize: (const Size(120, 40)),
                  ),
                  child: const Text("SUBMETER",
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

    if (_formQuestionKey.currentState!.validate()) {
      String discipline = disciplineController.text;
      String content = contentController.text;
      String institute = instituteController.text;
      String question = questionController.text;
      String alt1 = alt1Controller.text;
      String alt2 = alt2Controller.text;
      String alt3 = alt3Controller.text;
      String alt4 = alt4Controller.text;
      String alt5 = alt5Controller.text;
      String alt_correct = alterCorrectController.text;
      var correct = int.parse(alt_correct);

      List<Content> listaContent = [];
      List<Question> listaQuestion = [];
        if(discipline=='Física'){ //guarda conteudo encontrado (exclusivo)
          listaContent = await ContentDao().findContentPhysical(content);
        }else if(discipline=='Química'){
          listaContent = await ContentDao().findContentChemical(content);
        }else if(discipline=='Biologia'){
          listaContent = await ContentDao().findContentBiology(content);
        }else{
          listaContent = [];
        }


      int id_new = 0;

        if(listaContent.isNotEmpty){ //tratamento de objeto não nulo
          listaQuestion = await QuestionDao().getLastId(listaContent[0].id); //retorna id da ultima questão desta lista
          if(listaQuestion[0].id!=null){
            id_new = listaQuestion[0].id+1;
          }else{
            id_new = 1; //se não for encontrado, id será 1
          }
        }

      if(listaContent.isNotEmpty){
        Question new_question = Question(id: id_new, institute: institute,
            question: question, alt1: alt1, alt2: alt2, alt3: alt3, alt4: alt4,
            alt5: alt5, colorQuestion: listaContent[0].colorContent, alterCorrect: correct,
            idContent: listaContent[0].id);
        await QuestionDao().addQuestion(question: new_question);

        final msg = SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text('Questão adicionada ao banco com sucesso!'),
        );
        ScaffoldMessenger.of(context).showSnackBar(msg);

      }else{
        final msg = SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text('Disciplina ou Conteúdo inexistente, verifique a grafia correta da palavra. Se necessário consulte nossos Cards.'),
        );
        ScaffoldMessenger.of(context).showSnackBar(msg);
      }
    }
  }
}
