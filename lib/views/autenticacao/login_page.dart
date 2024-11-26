import 'package:flutter/material.dart';
import 'package:gestao/styles/app_styles.dart';
import 'package:gestao/views/perfil/app_alterar_senha.dart';
import 'package:gestao/views/autenticacao/cadastro.dart';
import 'package:gestao/views/autenticacao/esqueci_senha.dart';
import 'package:gestao/views/menu_page.dart';
import 'package:gestao/widgets/custom_button_widget.dart'; 
import 'package:provider/provider.dart';
import '../../controllers/auth_controller.dart';
import '../../widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {  // Nome da classe alterado para LoginPage
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();  // Estado também é alterado para _LoginPageState
}

class _LoginPageState extends State<LoginPage> {  // Alterado para _LoginPageState
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  bool _isLoading = false;
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthController>(context);

    return Scaffold(
      backgroundColor: AppStyles.backgroundColor,
      appBar: AppStyles.buildHeader(title: 'Login'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (_isLoading)
              const CircularProgressIndicator()
            else
              const SizedBox(height: 35),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: CustomTextField(
                      controller: emailController,
                      hintText: 'Email',
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 25, right: 25, top: 25, bottom: 10),
                    child: Text('Senha'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: CustomTextField(
                      controller: senhaController,
                      hintText: 'Senha',
                      obscureText: true,
                    ),
                  ),
                  const SizedBox(height: 35),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: CustomButton(
                      text: 'Entrar',
                      onPressed: () async {
                        final email = emailController.text;
                        final senha = senhaController.text;

                        if (email.isEmpty || senha.isEmpty) {
                          setState(() {
                            _errorMessage = 'Por favor, preencha todos os campos.';
                          });
                          return;
                        }

                        if (senha.length < 8) {
                          setState(() {
                            _errorMessage = 'A senha deve ter pelo menos 8 caracteres.';
                          });
                          return;
                        }

                        setState(() {
                          _isLoading = true;
                          _errorMessage = '';
                        });

                        try {
                          await authController.login(email, senha);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const MenuPage()),
                          );
                        } catch (e) {
                          setState(() {
                            _isLoading = false;
                            _errorMessage = e.toString();
                          });
                        }
                      },
                    ),
                  ),
                  if (_errorMessage.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        _errorMessage,
                        style: const TextStyle(color: Colors.red),
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
                              MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()),
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
                          text: 'Cadastre-se',
                          onTap: () async {
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const CadastroScreen()),
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
    );
  }
}
