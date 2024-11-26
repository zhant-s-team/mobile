import 'package:flutter/material.dart';
import '../../styles/app_styles.dart'; // Importando o estilo
import '../app_relatar_problema.dart'; // Importando o arquivo de Alterar Senha
import 'app_contato.dart'; // Importando a página de Contato
import '../menu_page.dart';

class AppSuport extends StatefulWidget {
  final bool showPasswordChangedPopup;

  const AppSuport({Key? key, this.showPasswordChangedPopup = false}) : super(key: key);

  @override
  _AppSuportState createState() => _AppSuportState();
}

class _AppSuportState extends State<AppSuport> {
  bool _isHovering = false; 
  
  @override
  void initState() {
    super.initState();

    if (widget.showPasswordChangedPopup) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Aviso"),
              content: const Text("Email Enviado!"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("OK"),
                ),
              ],
            );
          },
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.backgroundColor, 
      body: Stack(
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
                      builder: (context) => const MenuPage(),
                    ),
                  );
                },
                child: Text(
                  '<- Voltar',
                  style: TextStyle(
                    fontSize: 20,
                    color: _isHovering ? Colors.blue : Colors.black, 
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          const Positioned(
            top: 10.0,
            right: 10.0,
            child: Icon(
              Icons.headphones,
              size: 48.0,
              color: Colors.black,
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
                'Suporte',
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

          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 300.0,
                  height: 40.0,
                  margin: const EdgeInsets.only(bottom: 10.0), 
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AppRelatarProblem(),
                        ),
                      );
                    },
                    child: const Text(
                      "Relatar problema",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),

                Container(
                  width: 300.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Appcontact(), 
                        ),
                      );
                    },
                    child: const Text(
                      "Contato",
                      style: TextStyle(color: Colors.black),
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
