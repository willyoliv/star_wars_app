import 'package:flutter/material.dart';
import 'package:star_wars_app/models/personagem.dart';

class CardPersonagem extends StatefulWidget {
  final Personagem personagem;

  const CardPersonagem({Key? key, required this.personagem}) : super(key: key);

  @override
  State<CardPersonagem> createState() => _CardPersonagemState();
}

class _CardPersonagemState extends State<CardPersonagem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF222128),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.personagem.nome,
            style: const TextStyle(color: Colors.white),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                widget.personagem.isFavorito = !widget.personagem.isFavorito;
              });
            },
            child: Image.asset(
              widget.personagem.isFavorito
                  ? "assets/heart.png"
                  : "assets/heart-outline.png",
              color: Colors.pink,
              height: 28,
            ),
          )
        ],
      ),
    );
  }
}
