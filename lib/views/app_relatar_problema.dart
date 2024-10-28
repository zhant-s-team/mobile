import 'package:flutter/material.dart';
import '../styles/app_styles.dart';
import 'app_suporte.dart';

class AppRelatarProblem extends StatefulWidget {
  @override
  _AppRelatarProblemState createState() => _AppRelatarProblemState();
}

class _AppRelatarProblemState extends State<AppRelatarProblem> {
  bool _isHovering = false; // Variável para controlar o efeito de hover
  bool _isHeadphonesHovering = false; // Variável para controlar o hover dos headphones

  // Controladores para capturar o texto inserido pelo usuário
  final TextEditingController campo1Controller = TextEditingController();
  final TextEditingController campo2Controller = TextEditingController();
  final TextEditingController campo3Controller = TextEditingController();

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

          // Título centralizado "Relatar Problema"
          Positioned(
            top: 105.0,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Relatar Problema',
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

          // Campos de digitação centralizados
          Positioned.fill(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Campo de digitação 1
                  Container(
                    width: 300,
                    height: 40,
                    margin: EdgeInsets.only(bottom: 20),
                    child: TextField(
                      controller: campo1Controller,
                      decoration: InputDecoration(
                        hintText: 'Nome',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8), // Borda levemente arredondada
                          borderSide: BorderSide(color: Colors.grey), // Borda cinza
                        ),
                      ),
                    ),
                  ),
                  // Campo de digitação 2
                  Container(
                    width: 300,
                    height: 40,
                    margin: EdgeInsets.only(bottom: 20),
                    child: TextField(
                      controller: campo2Controller,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8), // Borda levemente arredondada
                          borderSide: BorderSide(color: Colors.grey), // Borda cinza
                        ),
                      ),
                    ),
                  ),
                  // Campo de digitação 3
                  Container(
                    width: 300,
                    height: 40,
                    child: TextField(
                      controller: campo3Controller,
                      decoration: InputDecoration(
                        hintText: 'Relate o problema',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8), // Borda levemente arredondada
                          borderSide: BorderSide(color: Colors.grey), // Borda cinza
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Botão "Confirmar Envio" centralizado e a 50px do final da tela
          Positioned(
            bottom: 50.0,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                width: 150,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    // Ação do botão
                    print("Envio confirmado");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(44, 44, 44, 1), // Cor de fundo do botão
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    "Confirmar Envio",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
