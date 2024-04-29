import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuración'),
      ),
      body: Center(
        child: Text(
          'Página de configuración',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}