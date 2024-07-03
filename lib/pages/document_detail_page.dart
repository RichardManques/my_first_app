import 'package:flutter/material.dart';
import 'package:my_first_app/models/document.dart';
import 'package:my_first_app/services/document_service.dart';

class DocumentDetailPage extends StatefulWidget {
  final Document document;

  DocumentDetailPage({required this.document});

  @override
  _DocumentDetailPageState createState() => _DocumentDetailPageState();
}

class _DocumentDetailPageState extends State<DocumentDetailPage> {
  final _formKey = GlobalKey<FormState>();
  final DocumentService documentService = DocumentService();

  late TextEditingController nameProyectController;
  late TextEditingController supplierController;
  late TextEditingController rutController;
  late TextEditingController addressController;
  late TextEditingController numberPhoneController;
  late TextEditingController dateCreationController;
  late TextEditingController costCenterController;
  late TextEditingController departmentController;
  late TextEditingController paymentMethodController;
  late TextEditingController createdAtController;
  late TextEditingController nameTransferController;
  late TextEditingController rutTransferController;
  late TextEditingController mailTransferController;
  late TextEditingController bankTransferController;
  late TextEditingController typeAccountTransferController;
  late TextEditingController numberAccountTransferController;
  late TextEditingController backupController;

  @override
  void initState() {
    super.initState();
    nameProyectController = TextEditingController(text: widget.document.nameProyect);
    supplierController = TextEditingController(text: widget.document.supplier);
    rutController = TextEditingController(text: widget.document.rut);
    addressController = TextEditingController(text: widget.document.address);
    numberPhoneController = TextEditingController(text: widget.document.numberPhone);
    dateCreationController = TextEditingController(text: widget.document.dateCreation.toIso8601String());
    costCenterController = TextEditingController(text: widget.document.costCenter);
    departmentController = TextEditingController(text: widget.document.department);
    paymentMethodController = TextEditingController(text: widget.document.paymentMethod);
    createdAtController = TextEditingController(text: widget.document.createdAt.toIso8601String());
    nameTransferController = TextEditingController(text: widget.document.nameTransfer);
    rutTransferController = TextEditingController(text: widget.document.rutTransfer);
    mailTransferController = TextEditingController(text: widget.document.mailTransfer);
    bankTransferController = TextEditingController(text: widget.document.bankTransfer);
    typeAccountTransferController = TextEditingController(text: widget.document.typeAccountTransfer);
    numberAccountTransferController = TextEditingController(text: widget.document.numberAccountTransfer);
    backupController = TextEditingController(text: widget.document.backup);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle del Documento'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () async {
              await documentService.deleteDocument(widget.document.id);
              Navigator.pop(context, true);  // return true to indicate the document was deleted
            },
          ),
        ],
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
                    await documentService.updateDocument(
                      widget.document.id,
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
                    Navigator.pop(context, false);  // return false to indicate the document was updated
                  }
                },
                child: Text('Actualizar Documento'),
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
