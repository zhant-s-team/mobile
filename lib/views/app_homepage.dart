import 'package:flutter/material.dart';
import '../styles/app_styles.dart';

class AppHomePage extends StatefulWidget {
  @override
  _AppHomePageState createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  bool isHoveringFretes = false;
  bool isHoveringPerfil = false;
  bool isHoveringSuporte = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.backgroundColor,
      appBar: AppStyles.buildHeader(title: 'Fretes Disponíveis'),
      body: Column(
        children: [
          // Menu Superior
          Container(
            height: 35, // Altura do menu
            color: Colors.transparent, // Cor de fundo transparente
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Espaçamento dinâmico
              children: [
                // Opção Fretes com destaque e animação
                Expanded(
                  child: MouseRegion(
                    onEnter: (_) => setState(() => isHoveringFretes = true),
                    onExit: (_) => setState(() => isHoveringFretes = false),
                    child: InkWell(
                      onTap: () {
                        // Ação ao clicar em "Fretes"
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        height: 35,
                        decoration: BoxDecoration(
                          color: isHoveringFretes
                              ? Colors.greenAccent.shade100
                              : Color.fromRGBO(184, 244, 190, 1), // Cor de fundo do destaque
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            'Fretes',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Opção Perfil com animação
                Expanded(
                  child: MouseRegion(
                    onEnter: (_) => setState(() => isHoveringPerfil = true),
                    onExit: (_) => setState(() => isHoveringPerfil = false),
                    child: InkWell(
                      onTap: () {
                        // Ação ao clicar em "Perfil"
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        height: 35,
                        decoration: BoxDecoration(
                          color: isHoveringPerfil
                              ? Colors.blueGrey.shade200
                              : Color.fromRGBO(217, 217, 217, 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            'Perfil',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Opção Suporte com animação
                Expanded(
                  child: MouseRegion(
                    onEnter: (_) => setState(() => isHoveringSuporte = true),
                    onExit: (_) => setState(() => isHoveringSuporte = false),
                    child: InkWell(
                      onTap: () {
                        // Ação ao clicar em "Suporte"
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        height: 35,
                        decoration: BoxDecoration(
                          color: isHoveringSuporte
                              ? Colors.blueGrey.shade200
                              : Color.fromRGBO(217, 217, 217, 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            'Suporte',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Retângulo branco com containers colado abaixo das opções
          Container(
            height: 85, // Altura do retângulo ajustada para 85px
            width: double.infinity, // Largura máxima da tela
            color: Color.fromRGBO(255, 255, 255, 1), // Cor branca
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Alinhamento vertical central
              children: [
                // Primeira linha com 3 containers
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Distribuição uniforme na largura
                  children: [
                    for (int i = 0; i < 3; i++) // 3 containers na primeira linha
                      Expanded(
                        child: Container(
                          height: 35,
                          margin: EdgeInsets.symmetric(horizontal: 2), // Espaçamento horizontal de 2px
                          color: Color.fromRGBO(255, 150, 91, 1), // Cor laranja
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 4), // Espaçamento de 4px entre as linhas (ajustado)

                // Segunda linha com 3 containers
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Distribuição uniforme na largura
                  children: [
                    for (int i = 0; i < 3; i++) // 3 containers na segunda linha
                      Expanded(
                        child: Container(
                          height: 35,
                          margin: EdgeInsets.symmetric(horizontal: 2), // Espaçamento horizontal de 2px
                          color: Color.fromRGBO(255, 150, 91, 1), // Cor laranja
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),

          // O restante do corpo da página
          Expanded(
            child: Center(
              child: Text('Conteúdo da página inicial aqui.'),
            ),
          ),
        ],
      ),
    );
  }
}
