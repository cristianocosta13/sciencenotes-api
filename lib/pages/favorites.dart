import 'package:flutter/material.dart';
import 'package:sciencenotes/assets/colors/custom_colors.dart';
import 'package:sciencenotes/data/favorites_dao.dart';
import 'package:sciencenotes/domain/favorites.dart';
import 'package:sciencenotes/widgets/favorites_card.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Os meus favoritos conteúdos',
          style: TextStyle(
              fontSize: 24,
              color: CustomColors.white,
              fontFamily: 'Staatliches'),
        ),
        backgroundColor: CustomColors.appeButtonColor,
      ),
      body: Container(
        color: CustomColors.gradienColor,
        child: Padding(
          padding: EdgeInsets.all(16),
          child:  Center(
          child: ListView(
            children: [
              buildListView(),
            ],
          ),
        ),)
      ),
    );
  }

  buildListView() {
    var list = FavoritesDAO().selectFavorites();
    return FutureBuilder<List<Favorites>>(
      future: list,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // ?? -> Verificar ser o conteudo de snapshot.data é nulo
          List<Favorites> list = snapshot.data ?? [];

          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              //pegando os elementos dessa lista e colonado no FavoriteCard
              return FavoriteCard(fav: list[index]);
            },
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
