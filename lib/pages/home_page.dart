import 'package:flutter/material.dart';
import 'package:my_first_app/services/auth_service.dart';
import 'package:my_first_app/pages/create_document.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => CreateDocumentPage()),
    );
          // Acción al presionar el botón, por ejemplo, mostrar un formulario para agregar un documento
        },
        child: Icon(
            Icons.add), // Icono del botón, en este caso, un ícono de agregar
        backgroundColor: const Color.fromARGB(255, 107, 33, 243), // Color de fondo del botón
      ),
    );
  }
}
