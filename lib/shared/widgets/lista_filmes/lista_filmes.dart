import 'package:flutter/material.dart';
import 'package:star_wars_app/models/filme.dart';
import 'package:star_wars_app/shared/widgets/card_filme/card_filme.dart';

class ListaFilmes extends StatelessWidget {
  final List<Filme> lista;
  const ListaFilmes({
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
            return CardFilme(filme: lista[index]);
          }),
    );
  }
}
