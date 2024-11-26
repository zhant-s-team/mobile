import 'package:flutter/material.dart';
import 'package:gestao/widgets/custom_button_widget.dart';  // Importação do custom button
import '../../styles/app_styles.dart';
import '../../widgets/custom_text_field.dart';
import 'package:gestao/services/auth_service.dart';  // Importe o AuthService

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final cnhController = TextEditingController();
  
  final AuthService _authService = AuthService();
  String _errorMessage = ''; // Mensagem de erro

  // Função para validar o formulário
  bool _validateForm() {
    final nome = nomeController.text;
    final email = emailController.text;
    final senha = senhaController.text;
    final cnh = cnhController.text;

    if (nome.isEmpty || nome.length < 3) {
      setState(() => _errorMessage = 'Nome deve ter pelo menos 3 caracteres.');
      return false;
    }
    if (!_isValidEmail(email)) {
      setState(() => _errorMessage = 'Por favor, insira um email válido.');
      return false;
    }
    if (senha.length < 8) {
      setState(() => _errorMessage = 'A senha deve ter no mínimo 8 caracteres.');
      return false;
    }
    if (cnh.length != 11) {  // CNH normalmente tem 11 caracteres numéricos
      setState(() => _errorMessage = 'CNH deve ter 11 caracteres.');
      return false;
    }
    
    setState(() => _errorMessage = ''); // Limpa a mensagem de erro
    return true;
  }

  // Função para validar se o email tem um formato correto
  bool _isValidEmail(String email) {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    return emailRegExp.hasMatch(email);
  }

  // Função que chama o serviço de registro
  Future<void> _register() async {
    if (_validateForm()) {
      final nome = nomeController.text;
      final email = emailController.text;
      final senha = senhaController.text;
      final cnh = cnhController.text;

      // Chamando o método de registro
      final result = await _authService.register(nome, email, senha, senha, cnh);

      if (result['success']) {
        // Caso sucesso
        Navigator.pop(context, "Cadastro realizado com sucesso!");
      } else {
        // Caso erro
        setState(() {
          _errorMessage = result['message'] ?? 'Erro desconhecido.';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.backgroundColor,
      appBar: AppStyles.buildHeader(title: 'Cadastro'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 255, 255, 1),
              border: Border.all(
                color: const Color.fromRGBO(217, 217, 217, 1),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 10.0, left: 20.0), 
                  child: Text('Nome'),
                ),
                CustomTextField(
                  hintText: 'Digite seu nome',
                  controller: nomeController,
                ),
                const SizedBox(height: 25),

                const Padding(
                  padding: EdgeInsets.only(bottom: 10.0, left: 20.0),
                  child: Text('Email'),
                ),
                CustomTextField(
                  hintText: 'Digite seu email',
                  controller: emailController,
                ),
                const SizedBox(height: 25),

                const Padding(
                  padding: EdgeInsets.only(bottom: 10.0, left: 20.0),
                  child: Text('Senha'),
                ),
                CustomTextField(
                  hintText: 'Digite sua senha',
                  controller: senhaController,
                  obscureText: true, 
                ),

                const SizedBox(height: 25),

                const Padding(
                  padding: EdgeInsets.only(bottom: 10.0, left: 20.0),
                  child: Text('CNH'),
                ),
                CustomTextField(
                  hintText: 'Digite sua CNH',
                  controller: cnhController,
                ),

                const SizedBox(height: 50),
                
                // Substituindo o ElevatedButton pelo CustomButtonWidget
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: CustomButton(
                    text: 'Cadastrar',
                    onPressed: _register,
                  ),
                ),

                const SizedBox(height: 20), 

                // Mensagem de erro, se houver
                if (_errorMessage.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(
                      _errorMessage,
                      style: const TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  ),
                
                // Substituindo o ElevatedButton pelo CustomButtonWidget
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25), 
                  child: CustomButton(
                    text: 'Limpar',
                    onPressed: () {
                      nomeController.clear();
                      emailController.clear();
                      senhaController.clear();
                      cnhController.clear();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
