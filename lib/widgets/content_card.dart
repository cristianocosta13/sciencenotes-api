import 'package:flutter/material.dart';
import 'package:sciencenotes/assets/colors/custom_colors.dart';
import 'package:sciencenotes/domain/favorites.dart';
import 'package:sciencenotes/data/favorites_dao.dart';
import 'package:sciencenotes/domain/content.dart';
import 'package:sciencenotes/pages/subject_page.dart';

class ContentCard extends StatefulWidget {
  final Content content;

  const ContentCard({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  State<ContentCard> createState() => _ContentCardState();
}

class _ContentCardState extends State<ContentCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        color: widget.content.colorContent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.content.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.black,
                        fontFamily: 'Abel-Regular'),
                  ),
                  IconButton(
                    icon: const Icon(Icons.favorite),
                    onPressed: onPressedButtonFavorites,
                    color: Colors.red,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.content.introduction,
                          style: const TextStyle(
                            fontSize: 18,
                            fontFamily: 'Abel-Regular',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 24.0),
                  Column(
                    children: [
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: Image.asset(widget.content.image),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: widget.content.colorButton),
                        onPressed: onPressedButton,
                        child: const Text(
                          'Ver mais',
                          style: TextStyle(
                              fontSize: 16,
                              color: CustomColors.white,
                              fontFamily: 'AmaticSC-Regular'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onPressedButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return SubjectPage(content: widget.content);
        },
      ),
    );
  }

  void onPressedButtonFavorites() {
    String name_content = widget.content.title;
    Favorites fav = Favorites(nameDiscipline: name_content, idContent: 12);
    FavoritesDAO().addFavorites(
      favorites: fav,
    );
  }
}
