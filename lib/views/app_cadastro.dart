import 'package:flutter/material.dart';
import '../styles/app_styles.dart';

class CadastroScreen extends StatelessWidget {
  const CadastroScreen({super.key});

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
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0), 
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Digite seu nome',
                    ),
                  ),
                ),
                const SizedBox(height: 25), 

                
                const Padding(
                  padding:  EdgeInsets.only(bottom: 10.0, left: 20.0),
                  child: Text('Email'),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Digite seu email',
                    ),
                  ),
                ),
                const SizedBox(height: 25),

                
                const Padding(
                  padding: EdgeInsets.only(bottom: 10.0, left: 20.0),
                  child: Text('Senha'),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Digite sua senha',
                    ),
                  ),
                ),

                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: ElevatedButton(
                    onPressed: () {
                      // Retorna uma mensagem para a tela de login ao finalizar o cadastro
                      Navigator.pop(context, "Cadastro realizado com sucesso!");
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
                        'Cadastrar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20), 

                
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25), 
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const CadastroScreen()),
                        );
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
                          'Limpar',
                          style: TextStyle(
                            color: Colors.white, 
                            fontSize: 18, 
                          ),
                        ),
                      ),
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