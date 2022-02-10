class Personagem {
  late String _nome;
  late bool _isFavorito;

  get nome => this._nome;

  set nome(value) => this._nome = value;

  get isFavorito => this._isFavorito;

  set isFavorito(value) => this._isFavorito = value;

  Personagem(String nome) {
    _nome = nome;
    _isFavorito = false;
  }
}
