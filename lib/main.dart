import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/app_controller.dart';
import '../models/app_model.dart';
import '../styles/app_styles.dart'; 
import '../views/app_esqueci_senha.dart';
import '../views/app_homepage.dart'; 
import '../views/app_cadastro.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
      appBar: AppStyles.buildHeader(title: 'Login'), 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            controller.loading ? const CircularProgressIndicator() : const SizedBox(height: 35),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 35),
              padding: const EdgeInsets.symmetric(vertical: 25),
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 255, 255, 1),
                border: Border.all(color: const Color.fromRGBO(217, 217, 217, 1), width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 10), 
                    child: Text('Email'),
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
                    child: Text('Senha'),
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
                          MaterialPageRoute(builder: (context) => AppHomePage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(44, 44, 44, 1),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Entrar',
                          style: TextStyle(color: Colors.white, fontSize: 18),
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
                        HoverText(
                          text: 'Esqueci a senha',
                          onTap: () async {
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
                            );
                            if (result != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(result),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            }
                          },
                        ),
                        const SizedBox(height: 2), 
                        Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HoverText(
                          text: 'Cadastre-se',
                          onTap: () async {
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CadastroScreen()),
                            );
                            if (result != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(result),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            }
                          },
                        ),
                        const SizedBox(height: 2), 
                        HoverText(
                          text: 'Suporte',
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("Relatar problema"),
                                  content: const Text("Email: viacargo@email.com"),
                                  actions: [
                                    TextButton(
                                      child: const Text("Fechar"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
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
          ]
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
