import 'package:flutter/material.dart';
import 'package:my_first_app/services/document_service.dart';

class CreateDocumentPage extends StatefulWidget {
  @override
  _CreateDocumentPageState createState() => _CreateDocumentPageState();
}

class _CreateDocumentPageState extends State<CreateDocumentPage> {
  final _formKey = GlobalKey<FormState>();
  final DocumentService documentService = DocumentService();

  TextEditingController nameProyectController = TextEditingController();
  TextEditingController supplierController = TextEditingController();
  TextEditingController rutController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController numberPhoneController = TextEditingController();
  TextEditingController dateCreationController = TextEditingController();
  TextEditingController costCenterController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController paymentMethodController = TextEditingController();
  TextEditingController createdAtController = TextEditingController();
  TextEditingController nameTransferController = TextEditingController();
  TextEditingController rutTransferController = TextEditingController();
  TextEditingController mailTransferController = TextEditingController();
  TextEditingController bankTransferController = TextEditingController();
  TextEditingController typeAccountTransferController = TextEditingController();
  TextEditingController numberAccountTransferController = TextEditingController();
  TextEditingController backupController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Documento'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField(nameProyectController, 'Nombre del Proyecto'),
              _buildTextField(supplierController, 'Proveedor'),
              _buildTextField(rutController, 'RUT'),
              _buildTextField(addressController, 'Dirección'),
              _buildTextField(numberPhoneController, 'Número de Teléfono'),
              _buildDatePickerField(dateCreationController, 'Fecha de Creación'),
              _buildTextField(costCenterController, 'Centro de Costos'),
              _buildTextField(departmentController, 'Departamento'),
              _buildTextField(paymentMethodController, 'Método de Pago'),
              _buildDatePickerField(createdAtController, 'Fecha de Creación'),
              _buildTextField(nameTransferController, 'Nombre de Transferencia'),
              _buildTextField(rutTransferController, 'RUT de Transferencia'),
              _buildTextField(mailTransferController, 'Correo de Transferencia'),
              _buildTextField(bankTransferController, 'Banco de Transferencia'),
              _buildTextField(typeAccountTransferController, 'Tipo de Cuenta de Transferencia'),
              _buildTextField(numberAccountTransferController, 'Número de Cuenta de Transferencia'),
              _buildTextField(backupController, 'Respaldo'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      // Agregar print statements para verificar los valores
                      print('nameProyect: ${nameProyectController.text}');
                      print('supplier: ${supplierController.text}');
                      print('rut: ${rutController.text}');
                      print('address: ${addressController.text}');
                      print('numberPhone: ${numberPhoneController.text}');
                      print('dateCreation: ${dateCreationController.text}');
                      print('costCenter: ${costCenterController.text}');
                      print('department: ${departmentController.text}');
                      print('paymentMethod: ${paymentMethodController.text}');
                      print('createdAt: ${createdAtController.text}');
                      print('nameTransfer: ${nameTransferController.text}');
                      print('rutTransfer: ${rutTransferController.text}');
                      print('mailTransfer: ${mailTransferController.text}');
                      print('bankTransfer: ${bankTransferController.text}');
                      print('typeAccountTransfer: ${typeAccountTransferController.text}');
                      print('numberAccountTransfer: ${numberAccountTransferController.text}');
                      print('backup: ${backupController.text}');

                      await documentService.addDocument(
                        nameProyectController.text,
                        supplierController.text,
                        rutController.text,
                        addressController.text,
                        numberPhoneController.text,
                        dateCreationController.text,
                        costCenterController.text,
                        departmentController.text,
                        paymentMethodController.text,
                        createdAtController.text,
                        nameTransferController.text,
                        rutTransferController.text,
                        mailTransferController.text,
                        bankTransferController.text,
                        typeAccountTransferController.text,
                        numberAccountTransferController.text,
                        backupController.text,
                      );
                      Navigator.pop(context);
                    } catch (e) {
                      print('Error al agregar documento: $e');
                    }
                  }
                },
                child: Text('Agregar Documento'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor ingresa $label';
        }
        return null;
      },
    );
  }

  Widget _buildDatePickerField(TextEditingController controller, String label) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );
        if (pickedDate != null) {
          setState(() {
            controller.text = pickedDate.toIso8601String();
          });
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor selecciona $label';
        }
        return null;
      },
    );
  }
}
