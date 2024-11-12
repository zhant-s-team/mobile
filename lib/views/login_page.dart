import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/auth_controller.dart';
import '../widgets/text_field_widget.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  // Funções de validação
  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira seu email';
    }
    // Validação simples de email
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Por favor, insira um email válido';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira sua senha';
    }
    // Validação simples de senha (mínimo de 6 caracteres)
    if (value.length < 6) {
      return 'A senha deve ter pelo menos 6 caracteres';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AuthController>(context, listen: false);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 25, 32, 51), // Fundo azul escuro
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img/logo.png', // Ajuste o caminho da imagem aqui
                width: 100,
              ),
              const SizedBox(height: 20),
              TextFieldWidget(
                controller: emailController,
                icon: Icons.email,
                label: 'Email',
                validator: emailValidator,
              ),
              const SizedBox(height: 10),
              TextFieldWidget(
                controller: passwordController,
                icon: Icons.lock,
                label: 'Senha',
                isSecret: true,
                validator: passwordValidator,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await controller.login(
                      emailController.text,
                      passwordController.text,
                    );

                    if (!context.mounted) return;
                    Navigator.pushReplacementNamed(context, '/home');
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Erro ao tentar fazer login!"),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Cor do botão
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
