import 'package:flutter/material.dart';

class TabPage extends StatelessWidget {
  final String texto;
  final int paginaSelecionada;
  final int numeroPagina;
  final String urlIcone;
  final Function alterarPagina;

  const TabPage({
    Key? key,
    required this.texto,
    required this.paginaSelecionada,
    required this.numeroPagina,
    required this.urlIcone,
    required this.alterarPagina,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: numeroPagina == paginaSelecionada
              ? const Color(0xFFFFE919)
              : null,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            if (numeroPagina == paginaSelecionada)
              Image.asset(
                urlIcone,
                height: 25,
                color: Colors.black,
              ),
            const SizedBox(width: 5),
            Text(
              texto,
              style: numeroPagina == paginaSelecionada
                  ? const TextStyle(color: Colors.black)
                  : const TextStyle(color: Color(0xFF646468)),
            )
          ],
        ),
      ),
      onTap: () {
        alterarPagina(numeroPagina);
      },
    );
  }
}
