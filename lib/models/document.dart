class Document {
  String id;
  String nameProyect;
  String supplier;
  String rut;
  String address;
  String numberPhone;
  DateTime dateCreation;
  String costCenter;
  String department;
  String paymentMethod;
  DateTime createdAt;
  String nameTransfer;
  String rutTransfer;
  String mailTransfer;
  String bankTransfer;
  String typeAccountTransfer;
  String numberAccountTransfer;
  String backup;

  Document({
    required this.id,
    required this.nameProyect,
    required this.supplier,
    required this.rut,
    required this.address,
    required this.numberPhone,
    required this.dateCreation,
    required this.costCenter,
    required this.department,
    required this.paymentMethod,
    required this.createdAt,
    required this.nameTransfer,
    required this.rutTransfer,
    required this.mailTransfer,
    required this.bankTransfer,
    required this.typeAccountTransfer,
    required this.numberAccountTransfer,
    required this.backup,
  });

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      id: json['_id'],
      nameProyect: json['nameProyect'],
      supplier: json['supplier'],
      rut: json['rut'],
      address: json['address'],
      numberPhone: json['numberPhone'],
      dateCreation: DateTime.parse(json['dateCreation']),
      costCenter: json['costCenter'],
      department: json['department'],
      paymentMethod: json['paymentMethod'],
      createdAt: DateTime.parse(json['createdAt']),
      nameTransfer: json['nameTransfer'],
      rutTransfer: json['rutTransfer'],
      mailTransfer: json['mailTransfer'],
      bankTransfer: json['bankTransfer'],
      typeAccountTransfer: json['typeAccountTransfer'],
      numberAccountTransfer: json['numberAccountTransfer'],
      backup: json['backup'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'nameProyect': nameProyect,
      'supplier': supplier,
      'rut': rut,
      'address': address,
      'numberPhone': numberPhone,
      'dateCreation': dateCreation.toIso8601String(),
      'costCenter': costCenter,
      'department': department,
      'paymentMethod': paymentMethod,
      'createdAt': createdAt.toIso8601String(),
      'nameTransfer': nameTransfer,
      'rutTransfer': rutTransfer,
      'mailTransfer': mailTransfer,
      'bankTransfer': bankTransfer,
      'typeAccountTransfer': typeAccountTransfer,
      'numberAccountTransfer': numberAccountTransfer,
      'backup': backup,
    };
  }
}
