import 'package:flutter/material.dart';
import 'package:gestao/models/app_model.dart';
import 'package:provider/provider.dart';
import '../controllers/app_controller.dart';
import '../styles/app_styles.dart';
import 'app_perfil_user.dart'; 

class PasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataController(ApiService()),
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<DataController>(context);

    return Scaffold(
      backgroundColor: AppStyles.backgroundColor,
      appBar: AppStyles.buildHeader(title: 'Alterar Senha'), 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            controller.loading
                ? const CircularProgressIndicator()
                : const SizedBox(height: 35), 

            
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 35), 
              padding: const EdgeInsets.symmetric(vertical: 25), 
              width: double.infinity, 
              decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 255, 255, 1), 
                border: Border.all(
                  color: const Color.fromRGBO(217, 217, 217, 1), 
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8), 
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, 
                children: [
                  
                  const Padding(
                    padding: EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 10), 
                    child: Text('Senha Atual'),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25), 
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(217, 217, 217, 1), 
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10), 
                      ),
                    ),
                  ),
                  
                  const Padding(
                    padding: EdgeInsets.only(left: 25, right: 25, top: 25, bottom: 10), 
                    child: Text('Nova Senha'),
                  ),
                  
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25), 
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(217, 217, 217, 1), 
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10), 
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 35), 
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25), 
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AppPerfilUser(showPasswordChangedPopup: true),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(44, 44, 44, 1), 
                        padding: const EdgeInsets.symmetric(vertical: 15), 
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), 
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Confirmar',
                          style: TextStyle(
                            color: Colors.white, 
                            fontSize: 18, 
                          ),
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 30), 
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25), 
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, 
                      children: [
                        
                        
                        const SizedBox(height: 2), 
                        HoverText(
                          text: 'Voltar',
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const AppPerfilUser()), 
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HoverText extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const HoverText({required this.text, required this.onTap});

  @override
  _HoverTextState createState() => _HoverTextState();
}

class _HoverTextState extends State<HoverText> {
  bool _isHovering = false; 

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
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
        onTap: widget.onTap,
        child: Text(
          widget.text,
          style: TextStyle(
            color: _isHovering ? Colors.blue : Colors.black, 
            fontSize: 14,
            decoration: TextDecoration.underline, 
          ),
        ),
      ),
    );
  }
}
