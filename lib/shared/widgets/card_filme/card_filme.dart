import 'package:flutter/material.dart';
import 'package:star_wars_app/models/filme.dart';

class CardFilme extends StatefulWidget {
  final Filme filme;
  const CardFilme({Key? key, required this.filme}) : super(key: key);

  @override
  State<CardFilme> createState() => _CardFilmeState();
}

class _CardFilmeState extends State<CardFilme> {
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
            widget.filme.titulo,
            style: TextStyle(color: Colors.white),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                widget.filme.isFavorito = !widget.filme.isFavorito;
              });
            },
            child: Image.asset(
              widget.filme.isFavorito
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
