import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/app_controller.dart';
import '../styles/app_styles.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<DataController>(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppStyles.backgroundColor,
      appBar: AppStyles.buildHeader(title: 'Esqueci Minha Senha'),
      body: Column(
        children: [
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
              width: screenWidth - 30,
              height: 239,
              decoration: BoxDecoration(
                color: Color.fromRGBO(217, 217, 217, 1),
                borderRadius: BorderRadius.circular(11),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 13),
                    Text(
                      'Digite seu E-mail:',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 12),
                    Container(
                      width: screenWidth - 290,
                      height: 27,
                      child: TextField(
                        controller: usernameController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromRGBO(210, 236, 255, 1),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color.fromRGBO(0, 163, 255, 1), width: 1),
                            borderRadius: BorderRadius.zero,
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Confirmar Email:',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 12),
                    Container(
                      width: screenWidth - 290,
                      height: 27,
                      child: TextField(
                        controller: passwordController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromRGBO(210, 236, 255, 1),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color.fromRGBO(0, 163, 255, 1), width: 1),
                            borderRadius: BorderRadius.zero,
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                        ),
                        obscureText: true,
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        HoverButton(
                          text: 'Confirmar',
                          onPressed: () {
                            print('Digite seu E-mail: ${usernameController.text}');
                            print('Confirmar Email: ${passwordController.text}');
                          },
                        ),
                        SizedBox(width: 15),
                        HoverButton(
                          text: 'Limpar',
                          onPressed: () {
                            usernameController.clear();
                            passwordController.clear();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 130),
          TextButton(
            onPressed: () {
              print('Link clicado: Suporte');
            },
            child: Text(
              'Suporte',
              style: TextStyle(
                color: Color.fromRGBO(64, 106, 255, 1),
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(height: 20),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Volta para a tela anterior
            },
            child: Text(
              'Voltar',
              style: TextStyle(
                color: Color.fromRGBO(64, 106, 255, 1),
                fontSize: 16,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: controller.loading
                  ? CircularProgressIndicator()
                  : controller.data != null
                      ? Text(controller.data!.title)
                      : Text(''),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.fetchData();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}

class HoverButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const HoverButton({required this.text, required this.onPressed, Key? key})
      : super(key: key);

  @override
  _HoverButtonState createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  Color _color = Color.fromRGBO(202, 52, 95, 0.35);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _color = Color.fromRGBO(202, 52, 95, 0.5);
        });
      },
      onExit: (_) {
        setState(() {
          _color = Color.fromRGBO(202, 52, 95, 0.35);
        });
      },
      child: GestureDetector(
        onTap: () {
          setState(() {
            _color = Color.fromRGBO(202, 52, 95, 0.7);
          });
          widget.onPressed();
          Future.delayed(Duration(milliseconds: 100), () {
            setState(() {
              _color = Color.fromRGBO(202, 52, 95, 0.35);
            });
          });
        },
        child: Container(
          width: 110,
          height: 25,
          decoration: BoxDecoration(
            color: _color,
            border: Border.all(color: Color.fromRGBO(202, 52, 95, 1), width: 1),
            borderRadius: BorderRadius.zero,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.7),
                spreadRadius: 1,
                blurRadius: 7,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
