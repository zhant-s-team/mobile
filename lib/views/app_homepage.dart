import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../styles/app_styles.dart'; // Importando o estilo
import 'app_perfil_user.dart'; // Importa a nova tela de perfil de usuário
import 'app_suporte.dart';

class AppHomePage extends StatefulWidget {
  @override
  _AppHomePageState createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  bool _isOverlayVisible = false; // Variável para controlar a visibilidade da tela sobreposta
  bool _isAccepted = false; // Variável para controlar o ícone de aceitação
  bool _isHovering = false; // Variável para controlar o efeito de hover
  bool _isHeadphonesHovering = false; // Variável para controlar o hover dos headphones

  @override
  void initState() {
    super.initState();
    _loadAcceptanceStatus(); // Carregar o estado de aceitação ao iniciar
  }

  // Método para carregar o status de aceitação salvo
  Future<void> _loadAcceptanceStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isAccepted = prefs.getBool('isAccepted') ?? false; // Carrega o valor salvo
    });
  }

  // Método para salvar o status de aceitação
  Future<void> _saveAcceptanceStatus(bool status) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isAccepted', status);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.backgroundColor, // Cor de fundo RGB(255, 255, 255, 1)
      body: 
      Stack(
        children: [
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
                        builder: (context) => AppPerfilUser(),
                      ),
                    );
                  },
              child: Text(
                'Marcelo',
                style: TextStyle(
                  fontSize: 20,
                  color: _isHovering ? Colors.blue : Colors.black, // Altera a cor ao passar o mouse
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ),
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
          Positioned(
            top: 80.0,
            left: 20.0,
            right: 20.0,
            child: Container(
              height: 1.0,
              color: Color(0xFFD9D9D9),
            ),
          ),
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
          Positioned(
            top: 160.0,
            left: 20.0,
            right: 20.0,
            child: Container(
              height: 1.0,
              color: Color(0xFFD9D9D9),
            ),
          ),
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
          
          Positioned(
            top: 275.0,
            left: 7.0,
            right: 7.0,
            child: Container(
              height: 240.0,
              decoration: BoxDecoration(
                color: Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Stack(
                children: [
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
                  Positioned(
                    top: 30.0,
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
                  Positioned(
                    top: 134.0,
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
                  Positioned(
                    top: 160.0,
                    right: 20.0,
                    child: SizedBox(
                      width: 140.0,
                      height: 40.0,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            _isOverlayVisible = true;
                          });
                        },
                        icon: _isAccepted
                            ? Icon(
                                Icons.check,
                                color: Colors.green,
                                size: 20.0,
                              )
                            : SizedBox.shrink(),
                        label: Text(
                          'Ver Mais',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(44, 44, 44, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_isOverlayVisible)
            Positioned.fill(
              child: Container(
                color: Color.fromRGBO(185, 185, 185, 0.894),
                child: Stack(
                  children: [
                    Positioned(
                      top: 20.0,
                      right: 20.0,
                      child: IconButton(
                        icon: Icon(Icons.close),
                        color: Colors.black,
                        iconSize: 30.0,
                        onPressed: () {
                          setState(() {
                            _isOverlayVisible = false;
                          });
                        },
                      ),
                    ),
                    Positioned(
                      top: 60.0,
                      left: 30.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Empresa: Local Fretes',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Cidade: Piracicaba',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Destino: Tupi Paulista',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Estado: Médio',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Porte do Veículo: Médio',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Tipo de Carga: Médio',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Distância de Trajeto: 354 Km',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Endereço: Rua do Porto, 123, Centro',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 50.0, // 50px acima da parte de baixo da tela
                      left: 0,
                      right: 0,
                      child: Center(
                        child: SizedBox(
                          width: 160.0,
                          height: 40.0,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              setState(() {
                                _isAccepted = true; // Define o estado de aceitação
                                _saveAcceptanceStatus(_isAccepted); // Salva o estado
                              });
                            },
                            icon: _isAccepted
                                ? Icon(
                                    Icons.check,
                                    color: Colors.green,
                                    size: 20.0,
                                  )
                                : SizedBox.shrink(), // Ícone condicional
                            label: Text(
                              'Aceitar Frete',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(44, 44, 44, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
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
