import 'package:flutter/cupertino.dart';
import 'package:star_wars_app/models/filme.dart';
import 'package:star_wars_app/models/personagem.dart';
import 'package:star_wars_app/repositories/filme_repository.dart';
import 'package:star_wars_app/repositories/personagem_repository.dart';
import 'package:star_wars_app/utils/enum_states.dart';

class Controller extends ChangeNotifier {
  FilmeRepository _filmesRepository = FilmeRepository();
  PersonagemRepository _personagemRepository = PersonagemRepository();
  List<Filme> _filmes = [];
  List<Personagem> _personagens = [];
  States _state = States.start;

  List<Filme> get filmes => this._filmes;
  List<Personagem> get personagens => this._personagens;

  get state => this._state;

  Future start() async {
    _state = States.loading;
    try {
      _filmes = await _filmesRepository.getAll();
      _personagens = await _personagemRepository.getAll();
      notifyListeners();
      _state = States.success;
    } catch (e) {
      print(e);
      _state = States.error;
    }
    print(_filmes);
    print(_personagens);
    notifyListeners();
  }
}
