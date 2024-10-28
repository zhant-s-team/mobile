import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/app_controller.dart';
import '../models/app_model.dart';
import '../styles/app_styles.dart'; // Importando o estilo
import '../views/app_esqueci_senha.dart';
import '../views/app_homepage.dart'; // Importando a tela "HomePage"
import '../views/app_cadastro.dart'; // Importando a tela de cadastro

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
      appBar: AppStyles.buildHeader(title: 'Login'), // Cabeçalho reutilizável
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            controller.loading
                ? CircularProgressIndicator()
                : SizedBox(height: 35), // Espaçamento de 35px da parte do login

            // Adicionando o retângulo abaixo do login
            Container(
              margin: EdgeInsets.symmetric(horizontal: 35), // 35px de distância das bordas laterais
              padding: EdgeInsets.symmetric(vertical: 25), // Espaço superior e inferior do container
              width: double.infinity, // Largura dinâmica
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 1), // Cor branca
                border: Border.all(
                  color: Color.fromRGBO(217, 217, 217, 1), // Borda de 1px na cor cinza
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8), // Bordas levemente arredondadas
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Alinhamento à esquerda
                children: [
                  // Texto "Email"
                  Padding(
                    padding: EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 10), // Ajuste de 5px da parte superior
                    child: Text('Email'),
                  ),
                  // Caixa de texto para Email
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25), // 25px de distância da borda
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(217, 217, 217, 1), // Cor da borda do campo de texto
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10), // Espaçamento interno
                      ),
                    ),
                  ),
                  // Texto "Senha"
                  Padding(
                    padding: EdgeInsets.only(left: 25, right: 25, top: 25, bottom: 10), // 25px de espaçamento da borda
                    child: Text('Senha'),
                  ),
                  // Caixa de texto para Senha
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25), // 25px de distância da borda
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(217, 217, 217, 1), // Cor da borda do campo de texto
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10), // Espaçamento interno
                      ),
                    ),
                  ),
                  // Botão "Entrar"
                  SizedBox(height: 35), // Ajuste do espaçamento para 40px entre senha e botão
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25), // 25px de distância da borda
                    child: ElevatedButton(
                      onPressed: () {
                        // Redirecionar para a tela app_homepage.dart ao pressionar o botão "Entrar"
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => AppHomePage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(44, 44, 44, 1), // Cor do botão
                        padding: EdgeInsets.symmetric(vertical: 15), // Tamanho do botão
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), // Bordas levemente arredondadas
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Entrar',
                          style: TextStyle(
                            color: Colors.white, // Cor do texto do botão
                            fontSize: 18, // Tamanho da fonte
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Textos Selecionáveis
                  SizedBox(height: 30), // Espaçamento de 15px abaixo do botão
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25), // Mesma distância da borda que o botão
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Alinhado à esquerda
                      children: [
                        // Texto "Esqueci minha senha" com efeito de hover
                        HoverText(
                          text: 'Esqueci minha senha',
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) => ForgotPasswordScreen(),
                                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  );
                                },
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 2), // Espaçamento de 2px entre os textos
                        HoverText(
                          text: 'Cadastre-se',
                          onTap: () {
                            // Navegando para a tela de cadastro
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CadastroScreen()),
                            );
                          },
                        ),
                        SizedBox(height: 2), // Espaçamento de 2px entre os textos
                        HoverText(
                          text: 'Suporte',
                          onTap: () {
                            // Exibindo o pop-up ao pressionar "Suporte"
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Relatar problema"),
                                  content: Text("Email: viacargo@email.com"),
                                  actions: [
                                    TextButton(
                                      child: Text("Fechar"),
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
    );
  }
}

// Classe reutilizável para adicionar o efeito de hover nos textos
class HoverText extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const HoverText({required this.text, required this.onTap});

  @override
  _HoverTextState createState() => _HoverTextState();
}

class _HoverTextState extends State<HoverText> {
  bool _isHovering = false; // Estado para verificar se o mouse está sobre o texto

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
            color: _isHovering ? Colors.blue : Colors.black, // Muda a cor ao passar o mouse
            fontSize: 14,
            decoration: TextDecoration.underline, // Sublinhado
          ),
        ),
      ),
    );
  }
}
