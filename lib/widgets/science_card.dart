import 'package:flutter/material.dart';

class ScienceCard extends StatefulWidget {
  final String scienceName;
  final String scienceImage;
  final Color colorCard;
  final Color colorButton;
  final Function directionPage;

  const ScienceCard({
    Key? key,
    required this.scienceName,
    required this.scienceImage,
    required this.colorCard,
    required this.colorButton,
    required this.directionPage,
  }) : super(key: key);

  @override
  State<ScienceCard> createState() => _ScienceCardState();
}

class _ScienceCardState extends State<ScienceCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        color: widget.colorCard,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.scienceName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.black,
                  fontFamily: 'Abel-Regular',
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Resumo',
                          style: TextStyle(
                              fontSize: 24, fontFamily: 'Abel-Regular'
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Equações',
                          style: TextStyle(
                              fontSize: 24, fontFamily: 'Abel-Regular'
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Aplicação',
                          style: TextStyle(
                              fontSize: 24, fontFamily: 'Abel-Regular'
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
                        child: Image.asset(widget.scienceImage),
                      ),
                      const SizedBox(height: 8.0,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: widget.colorButton),
                        onPressed: ()=> widget.directionPage(),
                        child:  const Text(
                          'Visualizar',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white, fontFamily: 'AmaticSC-Regular'
                          ),
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

}