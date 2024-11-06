import 'package:flutter/material.dart';
import 'package:gestao/main.dart';
import '../styles/app_styles.dart';

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                const Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Digite seu email',
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                
                const Padding(
                  padding: EdgeInsets.only(bottom: 10.0, left: 20.0),
                  child: Text('Confirmar Email'),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Confirme seu Email',
                    ),
                  ),
                ),

                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: ElevatedButton(
                    onPressed: () {
                      // Retorna uma mensagem para a tela de login ao finalizar o cadastro
                      Navigator.pop(context, "Senha alterada com sucesso!");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(44, 44, 44, 1),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Confirmar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
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
                              MaterialPageRoute(builder: (context) => MyApp()), 
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