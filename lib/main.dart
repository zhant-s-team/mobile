import 'package:flutter/material.dart';
import 'package:gestao/views/home_screen.dart';
import 'package:provider/provider.dart';
import '../controllers/app_controller.dart';
import '../models/app_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataController(ApiService()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
