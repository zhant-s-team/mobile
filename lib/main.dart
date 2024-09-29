import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/app_controller.dart';
import '../models/app_model.dart';
import '../styles/app_styles.dart';

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
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<DataController>(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppStyles.backgroundColor,
      appBar: AppStyles.buildHeader(title: 'Login'),
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
                    SizedBox(height: 13), // Espaço de 13px abaixo do topo
                    Text(
                      'Usuário:',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 12), // Espaço de 12px abaixo do texto "Usuário:"
                    Container(
                      width: screenWidth - 290, // 145px de distância de cada lado
                      height: 27,
                      child: TextField(
                        controller: usernameController,
                        textAlign: TextAlign.center, // Centraliza o texto horizontalmente
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromRGBO(210, 236, 255, 1),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color.fromRGBO(0, 163, 255, 1), width: 1),
                            borderRadius: BorderRadius.zero, // Retangular 100%
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 5.0), // Ajusta o preenchimento vertical
                        ),
                      ),
                    ),
                    SizedBox(height: 20), // Espaço de 20px abaixo do campo de usuário
                    Text(
                      'Senha:',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 12), // Espaço de 12px abaixo do texto "Senha:"
                    Container(
                      width: screenWidth - 290, // 145px de distância de cada lado
                      height: 27,
                      child: TextField(
                        controller: passwordController,
                        textAlign: TextAlign.center, // Centraliza o texto horizontalmente
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromRGBO(210, 236, 255, 1),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color.fromRGBO(0, 163, 255, 1), width: 1),
                            borderRadius: BorderRadius.zero, // Retangular 100%
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 5.0), // Ajusta o preenchimento vertical
                        ),
                        obscureText: true, // Esconde a senha
                      ),
                    ),
                    SizedBox(height: 30), // Reduzido para 30px para mover os botões para cima
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        HoverButton(
                          text: 'Confirmar',
                          onPressed: () {
                            print('Usuário: ${usernameController.text}');
                            print('Senha: ${passwordController.text}');
                          },
                        ),
                        SizedBox(width: 15), // Espaço de 15px entre os botões
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
          SizedBox(height: 75), // Espaço de 75px abaixo do quadrado para o texto "Esqueci minha senha"
          TextButton(
            onPressed: () {
              // Ação ao clicar no link
              print('Link clicado: Esqueci minha senha');
            },
            child: Text(
              'Esqueci minha senha',
              style: TextStyle(
                color: Color.fromRGBO(64, 106, 255, 1),
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(height: 20), // Espaço de 20px entre os textos
          TextButton(
            onPressed: () {
              // Ação ao clicar no link
              print('Link clicado: Cadastre-se');
            },
            child: Text(
              'Cadastre-se',
              style: TextStyle(
                color: Color.fromRGBO(64, 106, 255, 1),
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(height: 20), // Espaço de 20px entre os textos
          TextButton(
            onPressed: () {
              // Ação ao clicar no link
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
          Expanded(
            child: Center(
              child: controller.loading
                  ? CircularProgressIndicator()
                  : controller.data != null
                      ? Text(controller.data!.title)
                      : Text('Nenhum dado encontrado'),
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

  const HoverButton({required this.text, required this.onPressed, Key? key}) : super(key: key);

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
          _color = Color.fromRGBO(202, 52, 95, 0.5); // Cor ao passar o mouse
        });
      },
      onExit: (_) {
        setState(() {
          _color = Color.fromRGBO(202, 52, 95, 0.35); // Cor padrão
        });
      },
      child: GestureDetector(
        onTap: () {
          setState(() {
            _color = Color.fromRGBO(202, 52, 95, 0.7); // Cor ao clicar
          });
          widget.onPressed();
          Future.delayed(Duration(milliseconds: 100), () {
            setState(() {
              _color = Color.fromRGBO(202, 52, 95, 0.35); // Retorna à cor padrão após um atraso
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
