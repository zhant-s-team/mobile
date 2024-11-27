import 'package:flutter/material.dart';
import 'package:gestao/views/autenticacao/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'menu_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  
  @override
  void initState() {
    super.initState();
    _verificaToken();
  }

  void _verificaToken() async{
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = await prefs.getString('token') !=
      null;
    if(isLoggedIn){
      MaterialPageRoute(builder: (context) => const MenuPage());
    }else{
      MaterialPageRoute(builder: (context) => const LoginPage());
    }
  }
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}