import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:star_wars_app/controllers/controller.dart';
import 'package:star_wars_app/models/favorito.dart';
import 'package:star_wars_app/shared/widgets/card/card_favorito.dart';

class ListaFavoritos extends StatefulWidget {
  // final List<Favorito> lista;
  const ListaFavoritos({
    Key? key,
    // required this.lista,
  }) : super(key: key);

  @override
  State<ListaFavoritos> createState() => _ListaFavoritosState();
}

class _ListaFavoritosState extends State<ListaFavoritos> {
  @override
  Widget build(BuildContext context) {
    var _controllerApp = Provider.of<Controller>(context, listen: true);
    List<Favorito> favoritos = _controllerApp.favoritos;
    return Container(
      padding: const EdgeInsets.all(15),
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: favoritos.length,
          itemBuilder: (context, index) {
            return CardFavorito(favorito: favoritos[index]);
          }),
    );
  }
}
