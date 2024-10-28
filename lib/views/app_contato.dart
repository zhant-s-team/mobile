import 'package:flutter/material.dart';
import '../styles/app_styles.dart';
import 'app_suporte.dart';

class Appcontact extends StatefulWidget {
  @override
  _AppcontactState createState() => _AppcontactState();
}

class _AppcontactState extends State<Appcontact> {
  bool _isHovering = false; // Variável para controlar o efeito de hover
  bool _isHeadphonesHovering = false; // Variável para controlar o hover dos headphones

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.backgroundColor, // Cor de fundo RGB(255, 255, 255, 1)
      body: Stack(
        children: [
          // Botão de "Voltar" com efeito de hover
          Positioned(
            top: 20.0,
            left: 15.0,
            child: MouseRegion(
              onEnter: (_) {
                setState(() {
                  _isHovering = true;
                });
              },
              onExit: (_) {
                setState(() {
                  _isHovering = false;
                });
              },
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AppSuport(),
                    ),
                  );
                },
                child: Text(
                  '<- Voltar',
                  style: TextStyle(
                    fontSize: 20,
                    color: _isHovering ? Colors.blue : Colors.black, // Altera a cor ao passar o mouse
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          // Ícone de fones de ouvido
          Positioned(
            top: 10.0,
            right: 10.0,
            child: MouseRegion(
              onEnter: (_) {
                setState(() {
                  _isHeadphonesHovering = true;
                });
              },
              onExit: (_) {
                setState(() {
                  _isHeadphonesHovering = false;
                });
              },
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AppSuport(),
                    ),
                  );
                },
                child: Icon(
                  Icons.headphones,
                  size: 48.0,
                  color: _isHeadphonesHovering ? Colors.blue : Colors.black, // Altera a cor ao passar o mouse
                ),
              ),
            ),
          ),

          // Linha divisória superior
          Positioned(
            top: 80.0,
            left: 20.0,
            right: 20.0,
            child: Container(
              height: 1.0,
              color: Color(0xFFD9D9D9),
            ),
          ),

          // Título centralizado "Solicitação de alteração de perfil"
          Positioned(
            top: 105.0,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Contato',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),

          // Linha divisória abaixo do título
          Positioned(
            top: 160.0,
            left: 20.0,
            right: 20.0,
            child: Container(
              height: 1.0,
              color: Color(0xFFD9D9D9),
            ),
          ),

          // Campos de texto no centro da tela
          Positioned(
            top: 280.0, // Posição vertical inicial
            left: MediaQuery.of(context).size.width * 0.5 - 150, // Centraliza horizontalmente
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Texto acima do primeiro campo
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5.0, left: 0.0), // Alinhado à borda esquerda
                    child: Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                // Primeiro campo de texto
                Container(
                  width: 300, // Largura do campo
                  height: 40, // Altura do campo
                  child: TextField(
                    controller: TextEditingController(text: "viacargo@email.com"),
                    readOnly: true, // Campo não editável
                    textAlign: TextAlign.center, // Centraliza o texto dentro do campo
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8), // Bordas arredondadas
                        borderSide: BorderSide(color: Colors.grey), // Bordas cinzas
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20), // Espaçamento entre os campos
                // Texto acima do segundo campo
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5.0, left: 0.0), // Alinhado à borda esquerda
                    child: Text(
                      'WhatsApp',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                // Segundo campo de texto
                Container(
                  width: 300, // Largura do campo
                  height: 40, // Altura do campo
                  child: TextField(
                    controller: TextEditingController(text: "99 8877-6655"),
                    readOnly: true, // Campo não editável
                    textAlign: TextAlign.center, // Centraliza o texto dentro do campo
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8), // Bordas arredondadas
                        borderSide: BorderSide(color: Colors.grey), // Bordas cinzas
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
