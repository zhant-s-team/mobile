import 'package:flutter/material.dart';
import 'package:gestao/views/home/home_page2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../styles/app_styles.dart';
import 'perfil/app_perfil_user.dart';
import 'suporte/app_suporte.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int _selectedIndex = 0; // Index do item selecionado no BottomNavigationBar

  bool _isOverlayVisible = false;
  bool _isAccepted = false;
  bool _isHovering = false;
  bool _isHeadphonesHovering = false;

  @override
  void initState() {
    super.initState();
    _loadAcceptanceStatus();
  }

  Future<void> _loadAcceptanceStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isAccepted = prefs.getBool('isAccepted') ?? false;
    });
  }

  Future<void> _saveAcceptanceStatus(bool status) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isAccepted', status);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const HomePage2(), // Exibe todas as entregas
    const Center(child: Text('Fretes aceitos')), // Substituir com lista de fretes
    const AppPerfilUser(),
    const AppSuport(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.backgroundColor,
      body: _pages[_selectedIndex], // Exibe a página selecionada
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_shipping),
            label: 'Fretes aceitos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.headphones),
            label: 'Suporte',
          ),
        ],
      ),
    );
  }
}
