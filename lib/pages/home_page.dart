import 'package:flutter/material.dart';
import 'package:my_first_app/services/auth_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService authService = AuthService();
  List<dynamic> documents = [];
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    loadDocuments();
  }

  Future<void> loadDocuments() async {
    try {
      final List<dynamic> docs = await authService.getDocuments();
      setState(() {
        documents = docs;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Error al cargar los documentos';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Documentos',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await authService.logout();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: errorMessage.isNotEmpty
          ? Center(child: Text(errorMessage))
          : documents.isEmpty
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    final document = documents[index];
                    return ListTile(
                      title: Text(document['nameProyect'] ?? 'No Title'),
                      subtitle: Text(document['supplier'] ?? 'No Description'),
                    );
                  },
                ),
    );
  }
}
