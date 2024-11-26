/*import 'package:flutter/material.dart';
import 'package:gestao/services/api_service.dart';
import 'package:gestao/views/autenticacao/login_page.dart';
import 'package:provider/provider.dart';
import '../controllers/app_controller.dart';
import '../controllers/auth_controller.dart';  // Certifique-se de importar o AuthController

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DataController(ApiService())), // Fornece o DataController
        ChangeNotifierProvider(create: (context) => AuthController()), // Fornece o AuthController
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
        //pagina inicial seria AppHomePage() caso já logado
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/app_controller.dart';
import 'controllers/auth_controller.dart';
import 'services/api_service.dart';
import 'services/auth_service.dart';
import 'views/menu_page.dart';
import 'views/autenticacao/login_page.dart'; // Importando as rotas centralizadas

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Garantir que a inicialização dos plugins seja feita antes
  final isLoggedIn = await AuthService().getToken() !=
      null; // Verificar se o usuário está logado
  runApp(MyApp(isLoggedIn: isLoggedIn)); // Passar o estado de login para o app
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => EntregaController(ApiService())), // Fornece o DataController
        ChangeNotifierProvider(create: (context) => AuthController()), // Fornece o AuthController
      ],
      child: MaterialApp(
        title: 'ViaCargo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        ),
        initialRoute: isLoggedIn ? '/home' : '/login',
        routes: {
          '/login': (context) => const LoginPage(),
          '/home': (context) => const MenuPage(),
        },
      ),
    );
  }
}