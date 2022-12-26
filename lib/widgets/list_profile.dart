import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sciencenotes/domain/users.dart';
import 'package:sciencenotes/assets/colors/custom_colors.dart';
import 'package:sciencenotes/pages/about_page.dart';
import 'package:sciencenotes/pages/enter_page.dart';
import 'package:sciencenotes/pages/listPeople_page.dart';
import 'package:sciencenotes/pages/changeData_page.dart';
import 'package:sciencenotes/pages/statistics_page.dart';
import 'package:sciencenotes/widgets/card_functions.dart';

class ListProfile extends StatefulWidget {
  final Users user;
  const ListProfile({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<ListProfile> createState() => _ListProfileState();
}

class _ListProfileState extends State<ListProfile> {
  @override
  Widget build(BuildContext context){
    return Column(
        children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SEUS DADOS CADASTRAIS:',
                  style: TextStyle(
                    fontFamily: 'Abel-Regular',
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    const Text(
                      "Nome: ",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: CustomColors.textColor,
                          fontFamily: 'Abel-Regular'
                      ),
                    ),
                    Text(
                      widget.user.name,
                      style: const TextStyle(
                          fontSize: 22,
                          color: CustomColors.textColor,
                          fontFamily: 'Abel-Regular'
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    const Text(
                      "Usuário: ",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: CustomColors.textColor,
                          fontFamily: 'Abel-Regular'
                      ),
                    ),
                    Text(
                      widget.user.username,
                      style: const TextStyle(
                          fontSize: 22,
                          color: CustomColors.textColor,
                          fontFamily: 'Abel-Regular'
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    const Text(
                      "E-mail: ",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: CustomColors.textColor,
                          fontFamily: 'Abel-Regular'
                      ),
                    ),
                    Text(
                      widget.user.email,
                      style: const TextStyle(
                          fontSize: 22,
                          color: CustomColors.textColor,
                          fontFamily: 'Abel-Regular'
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    const Text(
                      "Data de Nascimento: ",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: CustomColors.textColor,
                        fontFamily: 'Abel-Regular',
                      ),
                    ),
                    Text(
                      widget.user.birthdate,
                      style: const TextStyle(
                          fontSize: 22,
                          color: CustomColors.textColor,
                          fontFamily: 'Abel-Regular'
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Center(
                  child:
                  ElevatedButton(
                    onPressed: onPressedButton,
                    style: ElevatedButton.styleFrom(
                      primary:CustomColors.appeButtonColor,
                    ),
                    child: const Text(
                      'ALTERAR DADOS CADASTRAIS',
                      style: TextStyle(
                        fontSize: 28,
                        color: CustomColors.white,
                        fontFamily: 'AmaticSC-Regular',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                const Text(
                  'OPÇÕES ADCIONAIS:',
                  style: TextStyle(
                    fontFamily: 'Abel-Regular',
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                CardFunction(
                  title: 'LISTA DE USUÁRIOS',
                  description: 'Venha conferir nossos outros usuários, seus irmãos '
                      'de caminhada na busca pelo conhecimento das ciências naturais.',
                  icon: const Icon(CupertinoIcons.person_3),
                  directionPage: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const listPeoplePage();
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10,),
                CardFunction(
                  title: 'APP INFO!',
                  description: 'Ainda tem dúvidas sobre nosso app? Que tal dar uma '
                      'olhada nos nossos objetivos e no que temos para te oferecer?',
                  icon: const Icon(CupertinoIcons.question_circle),
                  directionPage: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const AboutPage();
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10,),
                CardFunction(
                  title: 'FUTURO EINSTEIN!',
                  description: 'Como anda seu desempenho e o seu nível de aprendizado'
                      ' nas disciplinas que você estudou até agora? Venha dar uma '
                      'olhada nos seus percentuais de acerto e aprendizado!',
                  icon: const Icon(CupertinoIcons.graph_circle),
                  directionPage: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const StatisticsPage();
                        },
                      ),
                    );
                  },
                ),
              ]
          ),
        ]
    );
  }

  void onPressedButton(){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context){
          return const ChangeDataPage();
        },
      ),
    );
  }

  void onPressedButton2(){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context){
          return const listPeoplePage();
        },
      ),
    );
  }

  void onPressedButton3(){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context){
          return const EnterPage();
        },
      ),
    );
  }

}


