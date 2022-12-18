import 'package:flutter/material.dart';
import 'package:sciencenotes/widgets/content_card.dart';
import 'package:sciencenotes/domain/content.dart';

class ListaConteudo extends StatefulWidget {
  final Content conteudo1;
  final Content conteudo2;
  final Content conteudo3;
  final Content conteudo4;
  final Content conteudo5;
  final Content conteudo6;
  final Content conteudo7;
  final Content conteudo8;
  final Content conteudo9;
  final Content conteudo10;

  const ListaConteudo({
    Key? key,
    required this.conteudo1, required this.conteudo2, required this.conteudo3,
    required this.conteudo4, required this.conteudo5, required this.conteudo6,
    required this.conteudo7, required this.conteudo8, required this.conteudo9,
    required this.conteudo10,
  }) : super(key: key);

  @override
  State<ListaConteudo> createState() => _ListaConteudoState();
}

class _ListaConteudoState extends State<ListaConteudo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDFE9F5),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ContentCard(content: widget.conteudo1),
            ContentCard(content: widget.conteudo2),
            ContentCard(content: widget.conteudo3),
            ContentCard(content: widget.conteudo4),
            ContentCard(content: widget.conteudo5),
            ContentCard(content: widget.conteudo6),
            ContentCard(content: widget.conteudo7),
            ContentCard(content: widget.conteudo8),
            ContentCard(content: widget.conteudo9),
            ContentCard(content: widget.conteudo10),
          ],
        ),
      ),
    );
  }
}