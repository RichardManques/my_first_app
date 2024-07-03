import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_first_app/models/document.dart';

class DocumentService {
  final String baseUrl = 'http://10.0.2.2:3001/api/docuflow/documents';
  Future<void> addDocument(
    String nameProyect,
    String supplier,
    String rut,
    String address,
    String numberPhone,
    String dateCreation,
    String costCenter,
    String department,
    String paymentMethod,
    String createdAt,
    String nameTransfer,
    String rutTransfer,
    String mailTransfer,
    String bankTransfer,
    String typeAccountTransfer,
    String numberAccountTransfer,
    String backup,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'nameProyect': nameProyect,
        'supplier': supplier,
        'rut': rut,
        'address': address,
        'numberPhone': numberPhone,
        'dateCreation': dateCreation,
        'costCenter': costCenter,
        'department': department,
        'paymentMethod': paymentMethod,
        'createdAt': createdAt,
        'nameTransfer': nameTransfer,
        'rutTransfer': rutTransfer,
        'mailTransfer': mailTransfer,
        'bankTransfer': bankTransfer,
        'typeAccountTransfer': typeAccountTransfer,
        'numberAccountTransfer': numberAccountTransfer,
        'backup': backup,
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Error al agregar el documento:(');
    }
  }

  Future<List<Document>> getDocuments() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Document> documents =
          body.map((dynamic item) => Document.fromJson(item)).toList();
      return documents;
    } else {
      throw Exception('Failed to load documents');
    }
  }

  Future<bool> updateDocument(
    String id,
    String nameProyect,
    String supplier,
    String rut,
    String address,
    String numberPhone,
    String dateCreation,
    String costCenter,
    String department,
    String paymentMethod,
    String createdAt,
    String nameTransfer,
    String rutTransfer,
    String mailTransfer,
    String bankTransfer,
    String typeAccountTransfer,
    String numberAccountTransfer,
    String backup,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final url =
        Uri.parse(baseUrl); // Asegúrate de que la ruta coincide con tu API
    final response = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{
        'nameProyect': nameProyect,
        'supplier': supplier,
        'rut': rut,
        'address': address,
        'numberPhone': numberPhone,
        'dateCreation': dateCreation,
        'costCenter': costCenter,
        'department': department,
        'paymentMethod': paymentMethod,
        'createdAt': createdAt,
        'nameTransfer': nameTransfer,
        'rutTransfer': rutTransfer,
        'mailTransfer': mailTransfer,
        'bankTransfer': bankTransfer,
        'typeAccountTransfer': typeAccountTransfer,
        'numberAccountTransfer': numberAccountTransfer,
        'backup': backup,
      }),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      // Considera lanzar una excepción o manejar el error de manera adecuada
      print('Error al actualizar el documento: ${response.body}');
      return false;
    }
  }

  Future<bool> deleteDocument(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final Uri url = Uri.parse(baseUrl + '/' '$id');
    final response = await http.delete(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      // Documento eliminado con éxito
      return true;
    } else {
      // Manejo de errores
      print('Error al eliminar el documento: ${response.body}');
      return false;
    }
  }
}
