import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sciencenotes/api/mission_api.dart';
import 'package:sciencenotes/assets/colors/custom_colors.dart';
import 'package:sciencenotes/domain/mission.dart';

class AddMission extends StatefulWidget {
  const AddMission({Key? key}) : super(key: key);

  @override
  State<AddMission> createState() => _AddMissionState();
}

class _AddMissionState extends State<AddMission> {

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  final _formMissionKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADD MISSION',
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
                const Text('Agora você pode adicionar missões ao nosso banco de dados! '
                    'Preencha os campos abaixo com as devidas informações e '
                    'implemente novas missões na sua lista de missões. '
                    'Integre novas missões em nosso banco, a aventura quem faz é você!',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Abel-Regular',
                  ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 24,),
                const Text('ADICIONE SUA MISSÃO',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    fontFamily: 'Staatliches',
                  ),
                  textAlign: TextAlign.justify,
                ),
                Form(
                  key: _formMissionKey,
                  child: Column(
                      children: [
                        TextFormField(
                          controller: nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo Nome obrigatório';
                            }
                            return null;
                          },
                          obscureText: false,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.drive_file_rename_outline, color: CustomColors.appeButtonColor),
                            labelText: 'Nome',
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
                          controller: descriptionController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo Descrição obrigatório';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            icon: Icon(Icons.textsms_outlined, color: CustomColors.appeButtonColor),
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

    if (_formMissionKey.currentState!.validate()) {
      String name = nameController.text;
      String description = descriptionController.text;


      Mission new_mission = Mission(name: name, description: description);
      Future<bool> sendMission = MissionApi().addMission(new_mission.name, new_mission.description);

      if (await sendMission){
        final msg = SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text('Missão adicionada ao banco com sucesso!'),
        );
        ScaffoldMessenger.of(context).showSnackBar(msg);
      }else{
        final msg = SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text('Por algum motivo desconhecido, a missão não foi adicionada.'),
        );
        ScaffoldMessenger.of(context).showSnackBar(msg);
      }
    }
  }
}
