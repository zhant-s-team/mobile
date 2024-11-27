import 'package:flutter/material.dart';
import 'package:gestao/views/perfil/app_perfil_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../styles/app_styles.dart';
import '../suporte/app_suporte.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                        builder: (context) => const AppPerfilUser(),
                      ),
                    );
                  },
              child: Text(
                'Marcelo',
                style: TextStyle(
                  fontSize: 20,
                  color: _isHovering ? Colors.blue : Colors.black, 
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
                      builder: (context) => const AppSuport(),
                    ),
                  );
                },
                child: Icon(
                  Icons.headphones,
                  size: 48.0,
                  color: _isHeadphonesHovering ? Colors.blue : Colors.black, 
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
              color: const Color(0xFFD9D9D9),
            ),
          ),
          const Positioned(
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
              color: const Color(0xFFD9D9D9),
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
                    color: const Color(0xFFFF965B),
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
                color: const Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Stack(
                children: [
                  const Positioned(
                    top: 5.0,
                    left: 10.0,
                    child: Text(
                      '#723   Levar madeira até em Tupi',//Na api: titulo, o numero é o id da entrega
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
                  const Positioned(
                    top: 134.0,
                    left: 10.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Empresa: Local Fretes',//empresa que postou, pegaria o user_id, pega o nome
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          'Cidade de origem: Piracicaba',//na api: cidade_origem
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          'Cidade destino: Tupi Paulista',//na api: cidade_destino
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          'Tipo do veículo: Bi-trem',//na api: tipo_veiculo
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
          if (_isOverlayVisible)
            Positioned.fill(
              child: Container(
                color: const Color.fromRGBO(185, 185, 185, 0.894),
                child: Stack(
                  children: [
                    Positioned(
                      top: 20.0,
                      right: 20.0,
                      child: IconButton(
                        icon: const Icon(Icons.close),
                        color: Colors.black,
                        iconSize: 30.0,
                        onPressed: () {
                          setState(() {
                            _isOverlayVisible = false;
                          });
                        },
                      ),
                    ),
                    const Positioned(
                      top: 60.0,
                      left: 30.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Empresa: Local Fretesaa',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Cidade de origem: Piracicaba',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Cidade destino: Tupi Paulista',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Descrição: lorem' ,
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Tipo do Veículo: Bitrem',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Carga: Médio',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Distância de Trajeto: 354 Km',//na API: percurso 
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
                      bottom: 50.0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: SizedBox(
                          width: 160.0,
                          height: 40.0,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              setState(() {
                                _isAccepted = true; 
                                _saveAcceptanceStatus(_isAccepted); 
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
                              'Aceitar Frete',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
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