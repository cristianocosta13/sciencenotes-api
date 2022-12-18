import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sciencenotes/data/content_dao.dart';
import 'package:sciencenotes/data/resume_dao.dart';
import 'package:sciencenotes/domain/resume.dart';

import '../assets/colors/custom_colors.dart';
import '../domain/content.dart';

class AddResume extends StatefulWidget {
  const AddResume({Key? key}) : super(key: key);

  @override
  State<AddResume> createState() => _AddResumeState();
}

class _AddResumeState extends State<AddResume> {
  TextEditingController disciplineController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController paragraph1Controller = TextEditingController();
  TextEditingController paragraph2Controller = TextEditingController();
  TextEditingController paragraph3Controller = TextEditingController();
  TextEditingController paragraph4Controller = TextEditingController();
  TextEditingController urlImageController = TextEditingController();

  final _formResumeKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADD RESUME',
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
                const Text('Agora você pode adicionar resumos ao nosso banco de dados! '
                    'Preencha os campos abaixo com as devidas informações e '
                    'implemente novos resumos. '
                    'Integre novos resumos em nosso banco, o conhecimento quem faz é você!',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Abel-Regular',
                  ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 24,),
                const Text('ADICIONE SEU RESUMO',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    fontFamily: 'Staatliches',
                  ),
                  textAlign: TextAlign.justify,
                ),
                Form(
                  key: _formResumeKey,
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
                          controller: paragraph1Controller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo parágrafo 1 obrigatório';
                            }
                            return null;
                          },
                          obscureText: false,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.book, color: CustomColors.appeButtonColor),
                            labelText: 'Parafráfo 1',
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
                          controller: paragraph2Controller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo parágrafo 2 obrigatório';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            icon: Icon(Icons.book_outlined, color: CustomColors.appeButtonColor),
                            labelText: 'Paragráfo 2',
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
                          controller: paragraph3Controller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo Paragráfo 3 obrigatório';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            icon: Icon(Icons.book, color: CustomColors.appeButtonColor),
                            labelText: 'Parágrafo 3',
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
                          controller: paragraph4Controller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo Parágrafo 4 obrigatório';
                            }
                            return null;
                          },
                          obscureText: false,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.book, color: CustomColors.appeButtonColor),
                            labelText: 'Parágrafo 4',
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
                          controller: urlImageController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo url Imagem obrigatório';
                            }
                            return null;
                          },
                          obscureText: false,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.image_outlined, color: CustomColors.appeButtonColor),
                            labelText: 'urlImagem',
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

    if (_formResumeKey.currentState!.validate()) {
      String discipline = disciplineController.text;
      String content = contentController.text;
      String paragraph1 = paragraph1Controller.text;
      String paragraph2 = paragraph2Controller.text;
      String paragraph3 = paragraph3Controller.text;
      String paragraph4 = paragraph4Controller.text;
      String urlImage = urlImageController.text;

      List<Content> listaContent = [];
      List<Resume> listaResume = [];
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
        listaResume = await ResumeDao().getLastId(listaContent[0].id); //retorna id da ultima questão desta lista
        if(listaResume[0].id!=null){
          id_new = listaResume[0].id+1;
        }else{
          id_new = 1; //se não for encontrado, id será 1
        }
      }

      if(listaContent.isNotEmpty){
        Resume newResume = Resume(id: id_new, paragraph1: paragraph1, paragraph2: paragraph2, paragraph3: paragraph3, paragraph4: paragraph4, urlImage: urlImage, idContent: listaContent[0].id);
        await ResumeDao().addResume(resume: newResume);

        final msg = SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text('Resumo adicionado ao banco com sucesso!'),
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
