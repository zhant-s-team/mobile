import 'package:flutter/material.dart';
import '../../styles/app_styles.dart'; // Importando o estilo
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

          // Aqui começa o conteúdo da página de Contato
          Positioned(
            top: 280.0,
            left: MediaQuery.of(context).size.width * 0.5 - 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 5.0, left: 0.0),
                    child: Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  height: 40,
                  child: TextField(
                    controller: TextEditingController(text: "viacargo@email.com"),
                    readOnly: true,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 5.0, left: 0.0),
                    child: Text(
                      'WhatsApp',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  height: 40,
                  child: TextField(
                    controller: TextEditingController(text: "99 8877-6655"),
                    readOnly: true,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.grey),
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
