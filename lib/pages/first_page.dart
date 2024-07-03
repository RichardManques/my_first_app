import 'package:flutter/material.dart';
import 'package:my_first_app/pages/settings_page.dart';
import 'package:my_first_app/pages/profile_page.dart';
import 'package:my_first_app/pages/home_page.dart';

class FirstPage extends StatefulWidget{

  FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  //this keeps track of the current page to display
  int _selectedIndex = 0;

  //this method updates the new selected index
  void _navigateBottomBar(int index){
    setState((){
      _selectedIndex = index;
    });
  }

  final List _pages = [
    // Home
    HomePage(),
    // Profile
    ProfilePage(),
    // Settings
    SettingsPage(),
  ];

  @override

  Widget build(BuildContext context){
    return Scaffold(
      body : _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
      currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        items: [
        // Home
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          // Profile
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          // Settings
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configuración',
          ),
        ],
      ),
    );
  }
}