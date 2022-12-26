import 'package:flutter/material.dart';


class Mission extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;

  const Mission({
    Key? key,
    required this.title,
    required this.description,
    required this.icon,
  }) : super(key: key);

  @override
  State<Mission> createState() => _MissionCardState();
}



class _MissionCardState extends State<Mission> {
  @override

  Widget build(BuildContext context){
    return InkWell(
      child: Card(
          color: Color.fromARGB(255, 248, 214, 128),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                Row(
                  children: [
                    Icon(widget.icon),
                    const SizedBox(width: 12),
                    Text(widget.title,
                      style: TextStyle(
                        fontFamily: 'AmacticSC-Regular',
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                Text(widget.description,
                  style: TextStyle(
                    fontFamily: 'Abel-Regular',
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          )
      ),
    );
  }
}