import 'package:dio/dio.dart';
import 'package:star_wars_app/environments/environments.dart';
import 'package:star_wars_app/models/personagem.dart';

class PersonagemRepository {
  final dio = Dio();
  String url = Environments.BASE_API_URL + "/people";
  List<Personagem> _personagens = [];

  Future<List<Personagem>> getAll() async {
    final response = await dio.get(url);
    final results = response.data['results'] as List;
    int count = 0;
    for (var personagem in results) {
      _personagens.add(Personagem(personagem['name']));
      count++;
    }

    if (response.data['next'] != null) {
      url = response.data['next'];
      await getAll();
    }

    return _personagens;
  }
}
