import 'package:dio/dio.dart';
import 'package:star_wars_app/environments/environments.dart';
import 'package:star_wars_app/models/filme.dart';

class FilmeRepository {
  final dio = Dio();
  final String url = Environments.BASE_API_URL + "/films";

  Future<List<Filme>> getAll() async {
    final response = await dio.get(url);
    final results = response.data['results'] as List;
    List<Filme> filmes = [];
    for (var filme in results) {
      filmes.add(Filme(filme['title']));
    }

    return filmes;
  }
}
