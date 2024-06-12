import 'package:flutter/material.dart';
import 'package:my_first_app/pages/first_page.dart';
import 'package:my_first_app/services/auth_service.dart';
import 'package:my_first_app/pages/home_page.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService authService = AuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String errorMessage = '';

  Future<void> login() async {
    try {
      print('Email: ${emailController.text}, Password: ${passwordController.text}');
      final String token = await authService.login(
        emailController.text,
        passwordController.text,
      );
      // Navegar a la pantalla de inicio
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => FirstPage()),
      );
      // Manejar el inicio de sesión exitoso, posiblemente guardar el token
      print('Inicio de sesión exitoso, token: $token');
    } catch (e) {
      setState(() {
        errorMessage = 'Error al iniciar sesión. Por favor, intenta de nuevo.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Inicia sesión',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
                decoration: InputDecoration(
                labelText: 'Correo electrónico',
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                ),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: login,
              child: Text('Iniciar sesión'),
            ),
            if (errorMessage.isNotEmpty) ...[
              SizedBox(height: 20),
              Text(
                errorMessage,
                style: TextStyle(color: Colors.red),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
