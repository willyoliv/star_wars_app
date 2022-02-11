import 'package:flutter/material.dart';
import 'package:star_wars_app/models/favorito.dart';

class CardFavorito extends StatelessWidget {
  final Favorito favorito;
  const CardFavorito({Key? key, required this.favorito}) : super(key: key);

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
            favorito.nome,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
