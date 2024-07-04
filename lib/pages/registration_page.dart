import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Usuario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                labelText: 'Nombre',
              ),
            ),
            SizedBox(height: 20.0),
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
              onPressed: () {
                // Aquí iría la lógica para registrar el usuario
              },
              child: Text('Registrar'),
            ),
            SizedBox(height: 10.0),
            Text(
              errorMessage,
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}