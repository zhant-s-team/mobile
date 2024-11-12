import 'package:flutter/material.dart';
import 'package:gestao/controllers/app_controller.dart';
import 'package:gestao/styles/app_styles.dart';
import 'package:gestao/views/app_alterar_senha.dart';
import 'package:gestao/views/app_cadastro.dart';
import 'package:gestao/views/app_esqueci_senha.dart';
import 'package:gestao/views/app_homepage.dart';
import 'package:gestao/widgets/custom_button_widget.dart'; 
import 'package:provider/provider.dart';

import '../widgets/custom_text_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<DataController>(context);
    final emailController = TextEditingController(); // Controlador para o campo de email
    final senhaController = TextEditingController(); // Controlador para o campo de senha

    return Scaffold(
      backgroundColor: AppStyles.backgroundColor,
      appBar: AppStyles.buildHeader(title: 'Login'),
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
                      controller: emailController, // Usando o controlador de email
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
                      controller: senhaController, // Usando o controlador de senha
                      hintText: 'Senha',
                      obscureText: true,  // Para ocultar a senha
                    ),
                  ),
                  const SizedBox(height: 35),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: CustomButton(
                      text: 'Entrar',
                      onPressed: () {
                        // Aqui você pode pegar os valores dos campos para autenticação
                        final email = emailController.text;
                        final senha = senhaController.text;
                        print('O coletado é Email: $email, Senha: $senha');

                        // Aqui você pode adicionar a lógica de login com esses dados
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const AppHomePage()),
                        );
                      },
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
          ],
        ),
      ),
    );
  }
}
