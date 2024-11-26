import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../styles/app_styles.dart';


class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  _HomePageState2 createState() => _HomePageState2();
}

class _HomePageState2 extends State<HomePage2> {
  bool _isOverlayVisible = false; 
  bool _isAccepted = false; 
  bool _isHovering = false; 
  bool _isHeadphonesHovering = false; 

  @override
  void initState() {
    super.initState();
    _loadAcceptanceStatus(); 
  }


  Future<void> _loadAcceptanceStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isAccepted = prefs.getBool('isAccepted') ?? false; 
    });
  }

  Future<void> _saveAcceptanceStatus(bool status) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isAccepted', status);
  }

  @override
  Widget build(BuildContext context) {
return Scaffold(
  backgroundColor: AppStyles.backgroundColor,
  body: SingleChildScrollView( // Torna a página rolável
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0), // Adiciona um padding na parte superior e inferior
      child: Column(
        children: [
          // Exemplo de Card
          for (var i = 0; i < 10; i++) // Exemplo de um loop para várias entregas
            Card(
              margin: const EdgeInsets.only(bottom: 16), // Espaçamento entre os cards
              elevation: 4, // Define a sombra do card
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0), // Borda arredondada
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0), // Padding vertical e horizontal interno
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //CAMPO DE TEXTO DA TITULO
                    Text(
                      '#${723 + i}   Testando', // Exemplo de título com ID dinâmico
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    //FIM DO CAMPO DE TEXTO DO TITULO

                    // CAMPO DE IMAGEM DA EMPRESA
                    Center(
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

                    //FIM DO CAMPO DE IMAGEM DA EMPRESA

                  
                  const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //CAMPO DO NOME DA EMPRESA
                        Text(
                          'Empresa: Local Fretes',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        //FIM DO CAMPO DO NOME DA EMPRESA
                        SizedBox(height: 5.0),

                        //CAMPO DA CIDADE DE ORIGEM
                        Text(
                          'Cidade de origem: Piracicaba',//na api: cidade_origem
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        //FIM DO CAMPO CIDADE DE ORIGEM
                        SizedBox(height: 5.0),

                        //CAMPO DA CIDADE DE DESTINO
                        Text(
                          'Cidade destino: Tupi Paulista',//na api: cidade_destino
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        //FIM DO CAMPO DA CIDADE DE DESTINO
                        SizedBox(height: 5.0),

                        //CAMPO DO TIPO DE VEICULO
                        Text(
                          'Tipo do veículo: Bi-trem',//na api: tipo_veiculo
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        //FIM DO CAMPO DO TIPO DO VEICULO
                      ],
                    ),

                    //BOTÃO DE VER MAIS
                    Align(
                      alignment: Alignment.centerRight,
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
                              ? const Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 20.0,
                                )
                              : const SizedBox.shrink(),
                          label: const Text(
                            'Ver Mais',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromRGBO(44, 44, 44, 1),
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
        ],
      ),
    ),
  ),
);

  }
}