import 'package:flutter/material.dart';
import 'package:gestao/main.dart';
import 'package:gestao/widgets/custom_button_widget.dart';  // Importe o widget customizado
import '../styles/app_styles.dart';
import '../widgets/custom_text_field.dart';
import 'app_alterar_senha.dart'; // Importe o CustomTextField

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController confirmEmailController = TextEditingController();

    return Scaffold(
      backgroundColor: AppStyles.backgroundColor,
      appBar: AppStyles.buildHeader(title: 'Cadastro'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
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
                  child: Text('Email'),
                ),
                CustomTextField(
                  hintText: 'Digite seu email',
                  controller: emailController,
                ),

                const SizedBox(height: 40),

                const Padding(
                  padding: EdgeInsets.only(bottom: 10.0, left: 20.0),
                  child: Text('Confirmar Email'),
                ),
                CustomTextField(
                  hintText: 'Confirme seu email',
                  controller: confirmEmailController,
                  obscureText: true,  // Se necessário, você pode ajustar a visibilidade
                ),

                const SizedBox(height: 30),

                // Substituindo o ElevatedButton pelo CustomButtonWidget
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: CustomButton(
                    text: 'Confirmar',
                    onPressed: () {
                      // Retorna uma mensagem para a tela de login ao finalizar o cadastro
                      Navigator.pop(context, "Senha alterada com sucesso!");
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
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("Fechar"),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 2),
                      HoverText(
                        text: 'Voltar',
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const MyApp()),
                          );
                        },
                      ),
                    ],
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
