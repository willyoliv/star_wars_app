import 'package:flutter/material.dart';
import 'package:star_wars_app/controllers/controller.dart';
import 'package:star_wars_app/models/filme.dart';
import 'package:star_wars_app/shared/widgets/card_filme/card_filme.dart';

class ListaFilmes extends StatefulWidget {
  final List<Filme> lista;
  const ListaFilmes({
    Key? key,
    required this.lista,
  }) : super(key: key);

  @override
  State<ListaFilmes> createState() => _ListaFilmesState();
}

class _ListaFilmesState extends State<ListaFilmes> {
  var _controller;

  _adicionarOuRemoverFavorito(String nome) {
    _controller.adicionarOuRemoverFavorito(nome);
    setState(() {});
  }

  @override
  void initState() {
    _controller = Controller();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: widget.lista.length,
          itemBuilder: (context, index) {
            return CardFilme(
              filme: widget.lista[index],
              adicionarOuRemoverFavoritos: _adicionarOuRemoverFavorito,
            );
          }),
    );
  }
}
