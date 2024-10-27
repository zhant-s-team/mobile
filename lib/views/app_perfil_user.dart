import 'package:flutter/material.dart';
import '../styles/app_styles.dart'; // Importando o estilo
import 'app_homepage.dart';
import 'app_alterar_senha.dart'; // Importando o arquivo de Alterar Senha
import 'app_alterar_perfil.dart'; // Importando a página de Alterar Perfil

class AppPerfilUser extends StatefulWidget {
  final bool showPasswordChangedPopup;

  const AppPerfilUser({Key? key, this.showPasswordChangedPopup = false}) : super(key: key);

  @override
  _AppPerfilUserState createState() => _AppPerfilUserState();
}

class _AppPerfilUserState extends State<AppPerfilUser> {
  bool _isHovering = false; // Variável para controlar o efeito de hover
  
  @override
  void initState() {
    super.initState();

    // Exibe o pop-up se showPasswordChangedPopup for verdadeiro
    if (widget.showPasswordChangedPopup) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Aviso"),
              content: Text("Senha Alterada!"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
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
      backgroundColor: AppStyles.backgroundColor, // Cor de fundo RGB(255, 255, 255, 1)
      body: Stack(
        children: [
          // Botão de "Voltar" com efeito de hover
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
                      builder: (context) => AppHomePage(),
                    ),
                  );
                },
                child: Text(
                  '<- Voltar',
                  style: TextStyle(
                    fontSize: 20,
                    color: _isHovering ? Colors.blue : Colors.black, // Altera a cor ao passar o mouse
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          // Ícone de fones de ouvido
          Positioned(
            top: 10.0,
            right: 10.0,
            child: Icon(
              Icons.headphones,
              size: 48.0,
              color: Colors.black,
            ),
          ),

          // Linha divisória superior
          Positioned(
            top: 80.0,
            left: 20.0,
            right: 20.0,
            child: Container(
              height: 1.0,
              color: Color(0xFFD9D9D9),
            ),
          ),

          // Título centralizado "Configurar usuário"
          Positioned(
            top: 105.0,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Configurar usuário',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),

          // Linha divisória abaixo do título
          Positioned(
            top: 160.0,
            left: 20.0,
            right: 20.0,
            child: Container(
              height: 1.0,
              color: Color(0xFFD9D9D9),
            ),
          ),

          // Botões centralizados na tela
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Botão "Alterar Senha"
                Container(
                  width: 300.0,
                  height: 40.0,
                  margin: EdgeInsets.only(bottom: 10.0), // Espaçamento de 10px entre os botões
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: TextButton(
                    onPressed: () {
                      // Navegação para a tela de alterar senha
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PasswordScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Alterar Senha",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),

                // Botão "Alterar Perfil"
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
                      // Navegação para a tela de alterar perfil
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AppChangePerfil(), // Redireciona para AppChangePerfil
                        ),
                      );
                    },
                    child: Text(
                      "Alterar Perfil",
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
