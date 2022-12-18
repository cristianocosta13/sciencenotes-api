import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sciencenotes/assets/colors/custom_colors.dart';
import 'package:sciencenotes/domain/favorites.dart';

class FavoriteCard extends StatefulWidget {
  final Favorites fav;
  const FavoriteCard({super.key, required this.fav});

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.gradienColor,
      child: Column(children: [
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.fav.nameDiscipline,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Staatliches',
            ),
          ),
          const Icon(
            Icons.favorite,
            color: Colors.red,
          ),
        ],
      ),
      const Divider(),
      ],)
    );
  }
}
