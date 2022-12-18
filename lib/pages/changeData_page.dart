import 'package:flutter/material.dart';
import 'package:sciencenotes/assets/colors/custom_colors.dart';
//import 'package:sciencenotes/pages/register_page.dart';
//import 'package:sciencenotes/pages/enter_page.dart';
import 'package:sciencenotes/pages/profile_page.dart';


class ChangeDataPage extends StatefulWidget{
  const ChangeDataPage({Key? key}) : super(key: key);
  
  @override
  State<ChangeDataPage> createState() => _ChangeDataPage();
}

class _ChangeDataPage extends State<ChangeDataPage>{

  TextEditingController userController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override 
  Widget build(BuildContext context){
      return SafeArea(
        child: Scaffold (
          appBar: AppBar(
            centerTitle:false,
            backgroundColor: CustomColors.appeButtonColor,
            title: const Text(
              'Science Notes',
              style: TextStyle(fontSize: 24, color:CustomColors.white, fontFamily:'Staatliches'),

            ),
          ),
          backgroundColor: CustomColors.gradienColor,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const Text(
                            'Deseja alterar os dados?',
                            style: TextStyle(
                              fontSize: 30,
                              color: CustomColors.appeButtonColor,
                              fontFamily: 'Abel-Regular',
                            ),
                          ),
                          const SizedBox(height: 32),
                          const Text(
                            'Para alterar os dados preencha os campos com os novos dados',
                            style: TextStyle(
                              color: CustomColors.grey,
                              fontSize: 22,
                              fontFamily: 'Abel-Regular',
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 42),
                          TextFormField(
                            controller: nameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Campo nome obrigatório';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              icon: Icon(Icons.person, color: CustomColors.appeButtonColor),
                              labelText: 'Nome',
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: CustomColors.appeButtonColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: userController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Campo usuário obrigatório';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              icon: Icon(Icons.person_pin_rounded, color: CustomColors.appeButtonColor),
                              labelText: 'User',
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: CustomColors.appeButtonColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 32),
                          TextFormField(
                            controller: emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Campo email obrigatório';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              icon: Icon(Icons.email_outlined, color: CustomColors.appeButtonColor),
                              labelText: 'Email',
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: CustomColors.appeButtonColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          TextFormField(
                            controller: ageController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Campo idade obrigatório';
                              }

                              return null;
                            },
                            decoration: const InputDecoration(
                              icon: Icon(Icons.restore, color: CustomColors.appeButtonColor),
                              labelText: 'Idade',
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: CustomColors.appeButtonColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 76),
                          ElevatedButton(
                            onPressed: onPressedButton,
                            style: ElevatedButton.styleFrom(
                              primary: CustomColors.appeButtonColor,
                              minimumSize: (const Size(200, 40)),
                            ),
                            child: const Text(
                              'SALVAR ALTERAÇÕES',
                              style: TextStyle(
                                fontSize: 28,
                                color: CustomColors.white,
                                fontFamily: 'AmaticSC-Regular',
                              ),
                            ),
                          ),
                        ],
                      )
                    )
                  ),
            ),
          ),
        ),
      );
  }

  void onPressedButton() {
    if (_formKey.currentState!.validate()) {
      Navigator.pop(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const ProfilePage();
          },
        ),
      );
    }
  }
}
