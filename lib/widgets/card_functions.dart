import 'package:flutter/material.dart';

class CardFunction extends StatefulWidget {
  final String title;
  final String description;
  final Icon icon;
  final Function directionPage;

  const CardFunction({
    Key? key,
    required this.title, required this.description, required this.icon,
    required this.directionPage
    }) : super(key: key);

  @override
  State<CardFunction> createState() => _CardFunctionState();
}

class _CardFunctionState extends State<CardFunction
> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> widget.directionPage(),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        color: Colors.purple.shade50,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  widget.title,
                style: const TextStyle(
                  fontFamily: 'AmaticSC-Regular',
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  widget.icon,
                  const SizedBox(width: 10,),
                  Expanded(
                      child: Text(
                        widget.description,
                        style: const TextStyle(
                          fontFamily: 'Abel-Regular',
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.justify,
                      ),
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
