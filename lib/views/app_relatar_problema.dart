import 'package:flutter/material.dart';
import '../styles/app_styles.dart';
import 'app_suporte.dart';

class AppRelatarProblem extends StatefulWidget {
  @override
  _AppRelatarProblemState createState() => _AppRelatarProblemState();
}

class _AppRelatarProblemState extends State<AppRelatarProblem> {
  bool _isHovering = false; 

  final TextEditingController campo1Controller = TextEditingController();
  final TextEditingController campo2Controller = TextEditingController();
  final TextEditingController campo3Controller = TextEditingController();

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
                      builder: (context) => AppSuport(),
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
              color: Color(0xFFD9D9D9),
            ),
          ),

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

          Positioned(
            top: 160.0,
            left: 20.0,
            right: 20.0,
            child: Container(
              height: 1.0,
              color: Color(0xFFD9D9D9),
            ),
          ),

          Positioned.fill(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
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
                          borderRadius: BorderRadius.circular(8), 
                          borderSide: BorderSide(color: Colors.grey), 
                        ),
                      ),
                    ),
                  ),
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
                          borderRadius: BorderRadius.circular(8), 
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
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
                          borderRadius: BorderRadius.circular(8), 
                          borderSide: BorderSide(color: Colors.grey), 
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

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
                    print("Envio confirmado");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(44, 44, 44, 1), 
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
