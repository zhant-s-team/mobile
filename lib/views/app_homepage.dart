import 'package:flutter/material.dart';
import '../styles/app_styles.dart'; // Importando o estilo

class AppHomePage extends StatefulWidget {
  @override
  _AppHomePageState createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  bool _isOverlayVisible = false; // Variável para controlar a visibilidade da tela sobreposta

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.backgroundColor, // Cor de fundo RGB(255, 255, 255, 1)
      body: Stack(
        children: [
          // Conteúdo principal da página
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
              height: 1.0,
              color: Color(0xFFD9D9D9),
            ),
          ),
          // Texto "Fretes Disponíveis" centralizado
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
          // Adicionando 6 containers
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
          // Container com imagem e botão "Ver Mais"
          Positioned(
            top: 275.0,
            left: 7.0,
            right: 7.0,
            child: Container(
              height: 240.0, // Ajuste de altura para acomodar o texto
              decoration: BoxDecoration(
                color: Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Stack(
                children: [
                  // Texto dentro do container
                  Positioned(
                    top: 5.0,
                    left: 10.0,
                    child: Text(
                      '#723   Levar madeira até em Tupi',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  // Imagem dentro do container
                  Positioned(
                    top: 30.0, // 5px abaixo do texto
                    left: 0,
                    right: 0,
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/3f96a2704d779772f4f4be2df72a4fbf.png',
                          height: 94.0,
                          width: 274.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  // Quatro textos abaixo da imagem
                  Positioned(
                    top: 134.0, // 7px abaixo da imagem
                    left: 10.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Empresa: Local Fretes',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          'Cidade: Piracicaba',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          'Destino: Tupi Paulista',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          'Porte do veículo: Médio',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Botão "Ver Mais"
                  Positioned(
                    top: 160.0, // 40px abaixo da imagem
                    right: 20.0,
                    child: SizedBox(
                      width: 120.0, // Largura do botão
                      height: 40.0, // Altura do botão
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isOverlayVisible = true; // Mostra a tela sobreposta
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(44, 44, 44, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: Text(
                          'Ver Mais',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Tela sobreposta
          if (_isOverlayVisible)
            Positioned.fill(
              child: Container(
                color: Color.fromRGBO(255, 255, 255, 0.9), // Tela levemente transparente
                child: Stack(
                  children: [
                    // Botão "X" no canto superior direito
                    Positioned(
                      top: 20.0,
                      right: 20.0,
                      child: IconButton(
                        icon: Icon(Icons.close),
                        color: Colors.black,
                        iconSize: 30.0, // Tamanho do botão "X"
                        onPressed: () {
                          setState(() {
                            _isOverlayVisible = false; // Esconde a tela sobreposta
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
