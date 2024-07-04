import 'package:flutter/material.dart';
import 'package:my_first_app/models/document.dart';
import 'package:my_first_app/services/document_service.dart';
import 'package:my_first_app/pages/create_document.dart';
import 'package:my_first_app/pages/document_detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DocumentService documentService = DocumentService();
  late Future<List<Document>> futureDocuments;

  @override
  void initState() {
    super.initState();
    futureDocuments = documentService.getDocuments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Documentos',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Document>>(
        future: futureDocuments,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay documentos disponibles'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final document = snapshot.data![index];
                return ListTile(
                  title: Text(document.nameProyect),
                  subtitle: Text(document.supplier),
                  onTap: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DocumentDetailPage(document: document),
                      ),
                    );
                    if (result == true) {
                      // Document was deleted
                      setState(() {
                        futureDocuments = documentService.getDocuments();
                      });
                    } else if (result == false) {
                      // Document was updated
                      setState(() {
                        futureDocuments = documentService.getDocuments();
                      });
                    }
                  },
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateDocumentPage()),
          ).then((value) {
            if (value == true) {
              setState(() {
                futureDocuments = documentService.getDocuments();
              });
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
