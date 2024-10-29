import 'package:flutter/material.dart';
import 'package:gestao/main.dart';
import '../styles/app_styles.dart'; 

class CadastroScreen extends StatelessWidget {
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
              color: Color.fromRGBO(255, 255, 255, 1), 
              border: Border.all(
                color: Color.fromRGBO(217, 217, 217, 1), 
                width: 1, 
              ),
              borderRadius: BorderRadius.circular(8), 
            ),
            padding: const EdgeInsets.all(5.0), 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0, left: 20.0), 
                  child: Text('Nome'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0), 
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Digite seu nome',
                    ),
                  ),
                ),
                SizedBox(height: 25), 

                
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0, left: 20.0),
                  child: Text('Email'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Digite seu email',
                    ),
                  ),
                ),
                SizedBox(height: 25),

                
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0, left: 20.0),
                  child: Text('Senha'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Digite sua senha',
                    ),
                  ),
                ),
                SizedBox(height: 25),

                
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0, left: 20.0),
                  child: Text('CPF'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Digite seu CPF',
                    ),
                  ),
                ),
                SizedBox(height: 25),

                
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0, left: 20.0),
                  child: Text('Telefone'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Digite seu telefone',
                    ),
                  ),
                ),
                SizedBox(height: 25),

                
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0, left: 20.0),
                  child: Text('Data Nascimento'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Digite sua data de nascimento',
                    ),
                  ),
                ),
                SizedBox(height: 25),

                
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0, left: 20.0),
                  child: Text('CEP'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Digite seu CEP',
                    ),
                  ),
                ),
                SizedBox(height: 25),

                
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0, left: 20.0),
                  child: Text('Estado'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Digite seu estado',
                    ),
                  ),
                ),
                SizedBox(height: 25),

                
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0, left: 20.0),
                  child: Text('Bairro'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Digite seu bairro',
                    ),
                  ),
                ),
                SizedBox(height: 25),

                
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0, left: 20.0),
                  child: Text('Rua'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Digite sua rua',
                    ),
                  ),
                ),
                SizedBox(height: 25),

                
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25), 
                    child: ElevatedButton(
                      onPressed: () {
                        
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => MyApp()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(44, 44, 44, 1), 
                        padding: EdgeInsets.symmetric(vertical: 15), 
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), 
                        ),
                      ),
                      child: Center(
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

                SizedBox(height: 10), 

                
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25), 
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => CadastroScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(44, 44, 44, 1), 
                        padding: EdgeInsets.symmetric(vertical: 15), 
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), 
                        ),
                      ),
                      child: Center(
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