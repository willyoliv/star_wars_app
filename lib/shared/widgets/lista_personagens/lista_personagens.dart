import 'package:flutter/material.dart';
import 'package:star_wars_app/models/personagem.dart';
import 'package:star_wars_app/shared/widgets/card_personagem/card_personagem.dart';

class ListaPersonagens extends StatelessWidget {
  final List<Personagem> lista;
  const ListaPersonagens({
    Key? key,
    required this.lista,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: lista.length,
          itemBuilder: (context, index) {
            return CardPersonagem(personagem: lista[index]);
          }),
    );
  }
}
