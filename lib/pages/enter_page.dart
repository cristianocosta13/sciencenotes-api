import 'package:flutter/material.dart';
import 'package:sciencenotes/assets/colors/custom_colors.dart';
import 'package:sciencenotes/pages/register_page.dart';
import 'package:sciencenotes/pages/home_page.dart';
import 'package:sciencenotes/pages/recoverPassword_page.dart';
import 'package:sciencenotes/data/shared_prefs_helper.dart';
import '../api/enter_api.dart';

class EnterPage extends StatefulWidget {
  const EnterPage({Key? key}) : super(key: key);

  @override
  State<EnterPage> createState() => _EnterPageState();
}

class _EnterPageState extends State<EnterPage> {

  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: CustomColors.appeButtonColor,
        title: const Text(
          'Science Notes',
          style: TextStyle(fontSize: 24, color: Colors.white, fontFamily: 'Staatliches'),
        ),
      ),
      backgroundColor: CustomColors.gradienColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                      children: [
                        Image.asset('lib/assets/images/logo.png'),
                        TextFormField(
                          controller: userController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo usuário obrigatório';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            icon: Icon(Icons.account_box, color: CustomColors.appeButtonColor),
                            labelText: 'Usuário',
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
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.lock, color: CustomColors.appeButtonColor),
                            labelText: 'Senha',
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo senha obrigatório';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 36),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                onPressed: onPressedButton,
                                style: ElevatedButton.styleFrom(
                                  primary: CustomColors.appeButtonColor,
                                  minimumSize: (const Size(120, 40)),
                                ),
                                child: const Text(
                                  'Logar',
                                  style: TextStyle(
                                    fontSize: 28,
                                    color: CustomColors.white,
                                    fontFamily: 'AmaticSC-Regular',
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              TextButton(
                                onPressed:(){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const RecoverPasswordPage();
                                      },
                                    ),
                                  );
                                },
                                child: const Text("Esqueci a minha senha",
                                  style: TextStyle(
                                    color: CustomColors.textColor,
                                    fontSize: 15,
                                    fontFamily: 'Abel-Regular',
                                  ),
                                ),
                              ),
                            ]
                        ),
                        const SizedBox(height: 26),
                        TextButton(
                          onPressed:(){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const RegisterPage();
                                },
                              ),
                            );
                          },
                          child: const Text("Não tem uma conta? Cadastre-se.",
                            style: TextStyle(
                              color: CustomColors.textColor,
                              fontSize: 16,
                              fontFamily: 'Abel-Regular',
                            ),
                          ),
                        ),
                      ]
                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }

  void onPressedButton() async{
    if (_formKey.currentState!.validate()) {
      String user = userController.text;
      String pwd = passwordController.text;

      bool result = await EnterApi().findByUser(user, pwd);
      print(result);

      if (result) {
        SharedPrefsHelper().login();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const HomePage();
            },
          ),
        );
      } else {
        final msg = SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            ("Usuario/Senha incorretos"),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(msg);
      }
    } else {
      print("Formulário invalido");
    }
  }
}