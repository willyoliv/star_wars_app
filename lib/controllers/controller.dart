import 'package:flutter/material.dart';
import 'package:star_wars_app/models/favorito.dart';
import 'package:star_wars_app/models/filme.dart';
import 'package:star_wars_app/models/personagem.dart';
import 'package:star_wars_app/repositories/favorito_repository.dart';
import 'package:star_wars_app/repositories/filme_repository.dart';
import 'package:star_wars_app/repositories/personagem_repository.dart';
import 'package:star_wars_app/utils/enum_states.dart';

class Controller extends ChangeNotifier {
  final FilmeRepository _filmesRepository = FilmeRepository();
  final PersonagemRepository _personagemRepository = PersonagemRepository();
  final FavoritoRepository _favoritoRepository = FavoritoRepository();

  List<Filme> _filmes = [];
  List<Personagem> _personagens = [];
  List<Favorito> _favoritos = [];

  States _state = States.start;

  List<Filme> get filmes => _filmes;
  List<Personagem> get personagens => _personagens;
  List<Favorito> get favoritos => _favoritos;

  get state => _state;

  Future start() async {
    _state = States.loading;
    try {
      _filmes = await _filmesRepository.getAll();
      _personagens = await _personagemRepository.getAll();
      // _favoritos = await _favoritoRepository.getAll();
      // await _favoritoRepository.delete(1);
      for (var item in favoritos) {
        print("${item.id} ${item.nome}");
      }
      notifyListeners();
      _state = States.success;
    } catch (e) {
      _state = States.error;
    }
    notifyListeners();
  }

  void adicionarOuRemoverFavorito(String nome) async {
    if (_favoritos.isEmpty) {
      print("Entrei com o valor $nome no if vazio");
      Favorito favorito = Favorito(nome: nome);
      // Favorito favoritoCriado = await _favoritoRepository.create(favorito);
      _favoritos.add(favorito);
      notifyListeners();
    } else {
      var resultado =
          _favoritos.where((element) => element.nome == nome).toList();

      if (resultado.isNotEmpty) {
        // await _favoritoRepository.delete(resultado[0].id!);
        _favoritos.remove(resultado.first);
        notifyListeners();
      } else {
        Favorito favorito = Favorito(nome: nome);
        // Favorito favoritoCriado = await _favoritoRepository.create(favorito);
        _favoritos.add(favorito);
        notifyListeners();
      }
    }
  }
}
