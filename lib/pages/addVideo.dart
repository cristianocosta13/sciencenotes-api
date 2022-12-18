import 'package:flutter/material.dart';
import 'package:sciencenotes/assets/colors/custom_colors.dart';
import 'package:sciencenotes/data/content_dao.dart';
import 'package:sciencenotes/data/video_dao.dart';
import 'package:sciencenotes/domain/content.dart';
import 'package:sciencenotes/domain/videos.dart';

class AddVideo extends StatefulWidget {
  const AddVideo({Key? key}) : super(key: key);

  @override
  State<AddVideo> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddVideo> {

  TextEditingController disciplineController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController urlImageController = TextEditingController();
  TextEditingController tituloVideoController = TextEditingController();
  TextEditingController tempoDuracaoController = TextEditingController();
  TextEditingController urlVideoController = TextEditingController();

  final _formVideoKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADD VIDEOS',
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
                const Text('Agora você pode adicionar vídeos ao nosso banco de dados! '
                    'Preencha os campos abaixo com as devidas informações e '
                    'implemente novos vídeos na sua lista de exercícios. '
                    'Integre novos vídeos em nosso banco, o conhecimento quem faz é você!',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Abel-Regular',
                  ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 24,),
                const Text('ADICIONE SEU VÍDEO',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    fontFamily: 'Staatliches',
                  ),
                  textAlign: TextAlign.justify,
                ),
                Form(
                  key: _formVideoKey,
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
                          controller: urlImageController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo url da imagem obrigatório';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            icon: Icon(Icons.link, color: CustomColors.appeButtonColor),
                            labelText: 'Url da imagem',
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
                          controller: tituloVideoController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo título do vídeo obrigatório';
                            }
                            return null;
                          },
                          obscureText: false,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.title, color: CustomColors.appeButtonColor),
                            labelText: 'Título do vídeo',
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
                          controller: tempoDuracaoController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo tempo de duração obrigatório';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            icon: Icon(Icons.access_time_sharp, color: CustomColors.appeButtonColor),
                            labelText: 'Tempo de duração',
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
                          controller: urlVideoController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo url do vídeo obrigatório';
                            }
                            return null;
                          },
                          obscureText: false,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.link, color: CustomColors.appeButtonColor),
                            labelText: 'Url do vídeo',
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
                  child: const Text("CRIAR VÍDEO",
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

    if (_formVideoKey.currentState!.validate()) {
      String discipline = disciplineController.text;
      String content = contentController.text;
      String urlImage = urlImageController.text;
      String tituloVideo = tituloVideoController.text;
      String tempoDuracao = tempoDuracaoController.text;
      String urlVideo = urlVideoController.text;

      List<Content> listaContent = [];
      List<Videos> listaVideo = [];
      if (discipline == 'Física') {
        listaContent = await ContentDao().findContentPhysical(content);
      } else if (discipline == 'Química') {
        listaContent = await ContentDao().findContentChemical(content);
      } else if (discipline == 'Biologia') {
        listaContent = await ContentDao().findContentBiology(content);
      } else {
        listaContent = [];
      }

      int id_new = 0;

      if (listaContent.isNotEmpty) { //tratamento de objeto não nulo
        listaVideo = await VideosDao().getLastId(
            listaContent[0].id); //retorna id da ultima questão desta lista
        if (listaVideo[0].id != null) {
          id_new = listaVideo[0].id + 1;
        } else {
          id_new = 1; //se não for encontrado, id será 1
        }
      }

      if (listaContent.isNotEmpty) {
        Videos new_video = Videos(
            id: id_new,
            urlImage: urlImage,
            tituloVideo: tituloVideo,
            tempoDuracao: tempoDuracao,
            urlVideo: urlVideo,
            idContent: listaContent[0].id);
        await VideosDao().addVideo(video: new_video);

        final msg = SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text('Vídeo adicionado ao banco com sucesso!'),
        );
        ScaffoldMessenger.of(context).showSnackBar(msg);
      } else {
        final msg = SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
              'Disciplina ou Conteúdo inexistente, verifique a grafia correta da palavra. Se necessário consulte nossos Cards.'),
        );
        ScaffoldMessenger.of(context).showSnackBar(msg);
      }
    }
  }
}
