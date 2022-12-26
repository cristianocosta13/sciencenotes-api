import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sciencenotes/assets/colors/custom_colors.dart';
import 'package:sciencenotes/data/toDo_dao.dart';
import 'package:sciencenotes/domain/toDo.dart';
import 'package:sciencenotes/widgets/itemToDo_card.dart';
import 'package:sciencenotes/pages/addItem.dart';

class ToDoList extends StatefulWidget {

  const ToDoList({Key? key}) : super(key: key);

  @override
  State<ToDoList> createState() => _ToDoList();
}

class _ToDoList extends State<ToDoList> {
  Future<List<ToDo>> list = ToDoDao().listToDo();
  //List<ToDo> _foundToDo = [];

  /*@override
  void initState(){
    _foundToDo = todosList;
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.gradienColor,
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            search(),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only( //margem do container do texto
                    top: 20,
                    bottom: 20,
                  ),
                  child: Text(
                    'Todos os afazeres',
                    style: TextStyle(
                      fontSize: 50,
                      fontFamily: 'AmaticSC-Regular',
                      fontWeight: FontWeight.w500,
                      color: CustomColors.appeButtonColor,
                    ),
                  ),
                ),
                buildListView(),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context){
                return const AddItem();
              },
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: CustomColors.appeButtonColor,
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar( //construção da barra de aplicativos/AppBar
      title: Text(
        'TO-DO',
        style: TextStyle(
            fontSize: 24, color: CustomColors.white,  fontFamily: 'Staatliches'),
      ),
      backgroundColor: CustomColors.appeButtonColor,
    );
  }

  buildListView() {
    // list = ToDoDao().listToDo();
    return FutureBuilder<List<ToDo>>(
      future: list,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // ?? -> Verificar ser o conteudo de snapshot.data é nulo
          List<ToDo> list = snapshot.data ?? [];

          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return ItemCardWidget(afazer: list[index],);
            },
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  //é aqui que a funcionalidade da pesquisa acontece
  /*void _runFilter(String enteredKeyword) { //recebemos a palavra-chave inserida
    List<ToDo> results = []; //lista com o tipo de pendencias
    if (enteredKeyword.isEmpty) { //verifica se a palavra-chave está vazia
      results = todosList;
    } else {
      results = todosList
          .where((afazer) => afazer.afazerText!
          .toLowerCase() //converte para minusculas
          .contains(enteredKeyword //verifica se o texto contem a palavra-chave
          .toLowerCase())) //converte o texto para minusculas
          .listToDo(); //convertemos para uma lista
    }

    setState(() {
      _foundToDo = results; //fornecendo resultados encontrados
    });
  }*/

  search() { //criação da barra de pesquisa
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration( //decoração do Container
        color: Colors.white,
        borderRadius: BorderRadius.circular(20), //raio da borda circular
      ),
      child: Padding( //espaçamento nas bordas
        padding: const EdgeInsets.all(4.0),
        child: TextField( //campo de texto
          //onChanged: (value) => _runFilter(value),
          decoration: InputDecoration( //personalizando o campo de texto
            prefixIcon: Icon( //ícone de prefixo (lupa)
              Icons.search,
              color: Colors.black,
              size: 20,
            ),
            prefixIconConstraints: BoxConstraints( //restrições de ícone de prefixo
              maxHeight: 20, //altura máxima
              minWidth: 25, //largura mínima
            ),
            border: InputBorder.none, //sem bordas
            hintText: 'Search', //texto de pesquisa
            hintStyle: TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
