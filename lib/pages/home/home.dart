import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermojiCircleAvatar.dart';
import 'package:provider/provider.dart';
import 'package:star_wars_app/controllers/controller.dart';
import 'package:star_wars_app/db/app_database.dart';
import 'package:star_wars_app/shared/widgets/TabPage/tab_page.dart';
import 'package:star_wars_app/shared/widgets/lista_favoritos/lista_favoritos.dart';
import 'package:star_wars_app/shared/widgets/lista_filmes/lista_filmes.dart';
import 'package:star_wars_app/shared/widgets/lista_personagens/lista_personagens.dart';
import 'package:star_wars_app/utils/enum_states.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _paginaSelecionada = 0;
  late PageController _pageController;
  var _controllerApp;

  void _alterarPagina(int numeroPagina) {
    setState(() {
      _paginaSelecionada = numeroPagina;
      _pageController.animateToPage(
        numeroPagina,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    });
  }

  Widget _getWidgetByState(States state) {
    switch (state) {
      case States.start:
        return Container();
      case States.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case States.error:
        return const Center(
          child: Text(
            'Could not load data at this time!',
            style: TextStyle(color: Colors.white),
          ),
        );
      case States.success:
        return PageView(
          physics: const BouncingScrollPhysics(),
          onPageChanged: (int pagina) {
            setState(() {
              _paginaSelecionada = pagina;
            });
          },
          controller: _pageController,
          children: [
            ListaFilmes(lista: _controllerApp.filmes),
            ListaPersonagens(lista: _controllerApp.personagens),
            ListaFavoritos(),
          ],
        );
      default:
        return Container();
    }
  }

  @override
  void initState() {
    _pageController = PageController();
    _controllerApp = Provider.of<Controller>(context, listen: false);
    _controllerApp.start();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    AppDatabase.instance.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controllerApp = Provider.of<Controller>(context, listen: true);
    States state = _controllerApp.state;
    return Scaffold(
      backgroundColor: const Color(0xFF1C1B20),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/star-wars.png", color: Colors.white),
                  GestureDetector(
                    child: FluttermojiCircleAvatar(
                      backgroundColor: const Color(0xFFFFE919),
                      radius: 30,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/edit_avatar");
                    },
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TabPage(
                  texto: "Filmes",
                  urlIcone: "assets/movie.png",
                  paginaSelecionada: _paginaSelecionada,
                  numeroPagina: 0,
                  alterarPagina: _alterarPagina,
                ),
                TabPage(
                  texto: "Personagens",
                  urlIcone: "assets/darth-vader.png",
                  paginaSelecionada: _paginaSelecionada,
                  numeroPagina: 1,
                  alterarPagina: _alterarPagina,
                ),
                TabPage(
                  texto: "Favoritos",
                  urlIcone: "assets/heart.png",
                  paginaSelecionada: _paginaSelecionada,
                  numeroPagina: 2,
                  alterarPagina: _alterarPagina,
                ),
              ],
            ),
            Expanded(
              child: _getWidgetByState(state),
            ),
          ],
        ),
      ),
    );
  }
}
