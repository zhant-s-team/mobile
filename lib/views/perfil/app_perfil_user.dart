import 'package:flutter/material.dart';
import 'package:gestao/views/autenticacao/login_page.dart';
import 'package:gestao/views/entregas/entregas_finalizadas.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../services/auth_service.dart';
import '../../styles/app_styles.dart'; // Importando o estilo
import 'app_alterar_perfil.dart'; // Importando a página de Alterar Perfil

class AppPerfilUser extends StatefulWidget {
  final bool showPasswordChangedPopup;

  const AppPerfilUser({Key? key, this.showPasswordChangedPopup = false}) : super(key: key);

  @override
  _AppPerfilUserState createState() => _AppPerfilUserState();
}

class _AppPerfilUserState extends State<AppPerfilUser> {
  bool _isHovering = false;
  bool _isHeadphonesHovering = false;
  String _nome = 'Usuário';
  String _email = 'Email não disponível';

  @override
  void initState() {
    super.initState();
    _loadUserData();

    if (widget.showPasswordChangedPopup) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Aviso"),
              content: const Text("Senha Alterada!"),
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

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _nome = prefs.getString('user_name') ?? 'Usuário';
      _email = prefs.getString('user_email') ?? 'Email não disponível';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.backgroundColor,

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Divider(color: Color(0xFFD9D9D9), thickness: 1.0),

              // Exibição do Nome e Email
              Text(
                _nome,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                _email,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20.0),

              // Botões
              Container(
                width: double.infinity,
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
                        builder: (context) => const EntregasFinalizadas(),
                      ),
                    );
                  },
                  child: const Text(
                    "Ver entregas concluidas",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
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
                        builder: (context) => const AppChangePerfil(),
                      ),
                    );
                  },
                  child: const Text(
                    "Alterar Perfil",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 40.0,
                margin: const EdgeInsets.only(bottom: 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey),
                ),
                child: TextButton(
                  onPressed: () async {
                    // Realiza o logout
                    final result = await AuthService().logout();
                    if (result['success']) {
                      // Após o logout, redireciona o usuário para a tela de login
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    } else {
                      // Em caso de erro no logout, exibe a mensagem de erro
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(result['message'])),
                      );
                    }
                  },
                  child: const Text(
                    "Sair",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
