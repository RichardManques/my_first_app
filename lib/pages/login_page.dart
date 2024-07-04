import 'package:flutter/material.dart';
import 'package:my_first_app/pages/first_page.dart';
import 'package:my_first_app/pages/registration_page.dart';
import 'package:my_first_app/services/auth_service.dart';

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
      print(
          'Email: ${emailController.text}, Password: ${passwordController.text}');
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
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: 'Correo electrónico',
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: 'Contraseña',
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: login,
                child: Text('Iniciar sesión'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegistrationScreen()),
                  );
                },
                child: Text('Registrarse'),
              ),
              SizedBox(height: 10.0),
              Text(
                errorMessage,
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
