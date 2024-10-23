import 'package:flutter/material.dart';
import '../styles/app_styles.dart'; // Importando o estilo

class AppHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.backgroundColor, // Cor de fundo RGB(255, 255, 255, 1)
      body: Stack(
        children: [
          // Texto "Marcelo" no canto superior esquerdo
          Positioned(
            top: 20.0,
            left: 15.0, 
            child: Text(
              'Marcelo',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Ícone de headphone no canto superior direito
          Positioned(
            top: 10.0, 
            right: 10.0, 
            child: Icon(
              Icons.headphones, 
              size: 48.0, 
              color: Colors.black,
            ),
          ),
          // Primeira linha abaixo dos elementos
          Positioned(
            top: 80.0, 
            left: 20.0, 
            right: 20.0, 
            child: Container(
              height: 1.0, // Mantendo a linha fina
              color: Color(0xFFD9D9D9),
            ),
          ),
          // Texto "Fretes Disponíveis" centralizado entre as linhas
          Positioned(
            top: 105.0, 
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Fretes Disponíveis',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          // Segunda linha abaixo do texto
          Positioned(
            top: 160.0, 
            left: 20.0, 
            right: 20.0, 
            child: Container(
              height: 1.0, 
              color: Color(0xFFD9D9D9),
            ),
          ),
          // Adicionando 6 containers em Wrap
          Positioned(
            top: 175.0,
            left: 9.0,
            right: 7.0,
            child: Wrap(
              spacing: 5.0, 
              runSpacing: 5.0, 
              children: List.generate(6, (index) {
                return Container(
                  width: (MediaQuery.of(context).size.width - 26) / 3,
                  height: 40.0, 
                  decoration: BoxDecoration(
                    color: Color(0xFFFF965B),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                );
              }),
            ),
          ),
          // Container adicional abaixo dos 6 containers com pontas arredondadas
          Positioned(
            top: 275.0, // Mantendo a posição após os 6 containers
            left: 7.0,
            right: 7.0,
            child: Container(
              height: 235.0,
              decoration: BoxDecoration(
                color: Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(8.0), // Pontas levemente arredondadas
              ),
            ),
          ),
        ],
      ),
    );
  }
}
