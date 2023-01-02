import 'package:flutter/material.dart';
import 'package:sciencenotes/domain/mission.dart';


class MissionWidget extends StatefulWidget {
  final Mission mission;

  const MissionWidget({
    Key? key,
    required this.mission,
  }) : super(key: key);

  @override
  State<MissionWidget> createState() => _MissionCardState();
}

class _MissionCardState extends State<MissionWidget> {
  @override

  Widget build(BuildContext context){
    return InkWell(
      child: Card(
          color: const Color.fromARGB(255, 248, 214, 128),
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
                    //Icon(widget.icon),
                    const SizedBox(width: 12),
                    Text(widget.mission.name,
                      style: const TextStyle(
                        fontFamily: 'AmacticSC-Regular',
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                Text(widget.mission.description,
                  style: const TextStyle(
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
