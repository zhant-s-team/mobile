import 'package:flutter/material.dart';

class AppStyles {
  static const Color backgroundColor = Color.fromRGBO(255, 255, 255, 1);
  static const Color headerBackgroundColor = Color.fromRGBO(255, 249, 191, 1);

  // Função que retorna o cabeçalho
  static PreferredSizeWidget buildHeader({required String title}) {
    return PreferredSize(
      preferredSize: Size.fromHeight(122), // Altura do cabeçalho
      child: Container(
        width: 360, // Largura do cabeçalho
        color: headerBackgroundColor,
        child: Center( // Centraliza o conteúdo dentro do cabeçalho
          child: Text(
            title,
            style: TextStyle(
              fontSize: 24, // Tamanho da fonte
              fontWeight: FontWeight.bold,
              color: Colors.black, // Cor do texto
            ),
          ),
        ),
      ),
    );
  }
}
