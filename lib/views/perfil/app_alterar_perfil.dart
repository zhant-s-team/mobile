import 'package:flutter/material.dart';
import '../../styles/app_styles.dart';
import 'app_perfil_user.dart'; 
import '../suporte/app_suporte.dart';

class AppChangePerfil extends StatefulWidget {
  const AppChangePerfil({super.key});

  @override
  _AppChangePerfilState createState() => _AppChangePerfilState();
}

class _AppChangePerfilState extends State<AppChangePerfil> {
  bool _isHovering = false; 
  bool _isHeadphonesHovering = false; 

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alterar perfil.'),
      backgroundColor: AppStyles.backgroundColor, 
      ),
      body: Stack(
        children: [
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
                'Solicitação de alteração de perfil',
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
