import 'package:flutter/material.dart';
import 'package:sciencenotes/domain/content.dart';
import 'package:sciencenotes/domain/resume.dart';
import 'package:highlight_text/highlight_text.dart';


class ResumeCard extends StatefulWidget {
  final Resume resume;
  const ResumeCard({Key? key, required this.resume}) : super(key: key);

  @override
  State<ResumeCard> createState() => _ResumeCardState();
}

class _ResumeCardState extends State<ResumeCard> {

  String text = "";

  get children => null;

  makeDialog(BuildContext context, String text){
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.purple.shade100,
            content: Text(
              text,
              style: TextStyle(fontFamily: 'Abel-Regular'),
            ),
          );
        }
    );
  }

  Map<String, HighlightedWord> makewords(context) {
    return {
      "Cinemática": HighlightedWord(
        onTap: () {
          makeDialog(context, text);
        },
        textStyle: const TextStyle(
          color: Colors.purple,
        ),
      ),
      "Tema": HighlightedWord(
        onTap: () {
          makeDialog(context, text);
        },
        textStyle: const TextStyle(
          color: Colors.purple,
        ),
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          buildText(text: widget.resume.paragraph1),
          const SizedBox(height: 8,),
          buildText(text: widget.resume.paragraph2),
          const SizedBox(height: 8,),
          Center(
            child: SizedBox(
              height: 400,
              width: 400,
              child: Image.network(
                widget.resume.urlImage,
                fit: BoxFit.contain,
              ),
            ),
          ),
          buildText(text: widget.resume.paragraph3),
          const SizedBox(height: 8,),
          buildText(text: widget.resume.paragraph4),
          TextHighlight(
            text: text,
            words: makewords(context),
            textStyle: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }


  Text buildText({
    required String text,
  }) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'Abel-Regular',
        fontSize: 18,
      ),
      textAlign: TextAlign.justify,
    );
  }

}
