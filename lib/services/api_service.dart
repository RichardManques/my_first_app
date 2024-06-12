import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/document.dart';

class ApiService {
  final String baseUrl = 'http://10.0.2.2:3001/api/docuflow/documents';

  Future<List<Document>> getDocuments(String token) async {
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((doc) => Document.fromJson(doc)).toList();
    } else {
      throw Exception('Error al cargar los documentos :(');
    }
  }
}
