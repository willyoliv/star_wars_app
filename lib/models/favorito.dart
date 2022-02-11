final String tableFavoritos = 'favoritos';

class FavoritoFields {
  static final List<String> values = [id, nome];
  static final String id = "_id";
  static final String nome = "nome";
}

class Favorito {
  final int? id;
  final String nome;

  const Favorito({
    this.id,
    required this.nome,
  });

  static Favorito fromJson(Map<String, Object?> json) => Favorito(
      id: json[FavoritoFields.id] as int?,
      nome: json[FavoritoFields.nome] as String);

  Map<String, Object?> toJson() => {
        FavoritoFields.id: id,
        FavoritoFields.nome: nome,
      };

  Favorito copy({
    int? id,
    String? nome,
  }) =>
      Favorito(
        id: id ?? this.id,
        nome: nome ?? this.nome,
      );
}
