class Filme {
  late String _titulo;
  late bool _isFavorito;

  get titulo => this._titulo;

  set titulo(value) => this._titulo = value;

  get isFavorito => this._isFavorito;

  set isFavorito(value) => this._isFavorito = value;

  Filme(String titulo) {
    _titulo = titulo;
    _isFavorito = false;
  }
}
