import 'package:flutter/material.dart';
import 'package:gestao/widgets/custom_button_widget.dart';  // Importação do custom button
import '../styles/app_styles.dart';
import '../widgets/custom_text_field.dart';

class CadastroScreen extends StatelessWidget {
  const CadastroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Criando os controladores para os campos de entrada
    final nomeController = TextEditingController();
    final emailController = TextEditingController();
    final senhaController = TextEditingController();
    final cnhController = TextEditingController(); // Adicionando controlador para CNH

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
                  obscureText: true, // Definindo que a senha será oculta
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
                    onPressed: () {
                      final nome = nomeController.text;
                      final email = emailController.text;
                      final senha = senhaController.text;
                      final cnh = cnhController.text; // Pegando o valor da CNH

                      // Aqui você pode adicionar a lógica para enviar os dados para o backend
                      print('Nome: $nome Email: $email Senha: $senha CNH: $cnh');
                      
                      Navigator.pop(context, "Cadastro realizado com sucesso!");
                    },
                  ),
                ),

                const SizedBox(height: 20), 

                // Substituindo o ElevatedButton pelo CustomButtonWidget
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25), 
                  child: CustomButton(
                    text: 'Limpar',
                    onPressed: () {
                      // Limpar os campos
                      nomeController.clear();
                      emailController.clear();
                      senhaController.clear();
                      cnhController.clear(); // Limpando o campo de CNH
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
