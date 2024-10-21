import 'package:flutter/material.dart';
import '../styles/app_styles.dart'; // Importando o estilo

class CadastroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.backgroundColor,
      appBar: AppStyles.buildHeader(title: 'Cadastro'), // Cabeçalho reutilizável
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0), // Distância da borda lateral
        child: SingleChildScrollView( // Adicionado para permitir rolagem
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 1), // Cor do fundo
              border: Border.all(
                color: Color.fromRGBO(217, 217, 217, 1), // Cor da borda
                width: 1, // Largura da borda
              ),
              borderRadius: BorderRadius.circular(8), // Bordas levemente arredondadas
            ),
            padding: const EdgeInsets.all(5.0), // Distância interna do container
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Campo Nome
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0, left: 20.0), // Distância inferior e lateral ajustada
                  child: Text('Nome'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0), // Distância lateral de 20 pixels
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Digite seu nome',
                    ),
                  ),
                ),
                SizedBox(height: 25), // Espaçamento entre os campos

                // Campo Email
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

                // Campo Senha
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

                // Campo CPF
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

                // Campo Telefone
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

                // Campo Data Nascimento
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

                // Campo CEP
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

                // Campo Estado
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

                // Campo Bairro
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

                // Campo Rua
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

                // Botão de Confirmar
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Ação para cadastrar o usuário
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(44, 44, 44, 1), // Cor do botão
                      padding: EdgeInsets.symmetric(vertical: 15),
                      minimumSize: Size(double.infinity, 50), // Largura do botão
                    ),
                    child: Text(
                      'Confirmar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                
                SizedBox(height: 10), // Espaçamento entre os botões

                // Botão de Limpar
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Ação para limpar os campos
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(44, 44, 44, 1), // Cor do botão
                      padding: EdgeInsets.symmetric(vertical: 15),
                      minimumSize: Size(double.infinity, 50), // Largura do botão
                    ),
                    child: Text(
                      'Limpar',
                      style: TextStyle(color: Colors.white),
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
