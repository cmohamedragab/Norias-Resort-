
class Guest {
  final String id;
  final String fullName;
  final String phoneNumber;
  final String? nationalId;
  final String? address;
  final String? notes;
  final DateTime createdAt;
  final String createdBy;

  const Guest({
    required this.id,
    required this.fullName,
    required this.phoneNumber,
    this.nationalId,
    this.address,
    this.notes,
    required this.createdAt,
    required this.createdBy,
  });

  // التحقق من صحة البيانات الأساسية
  bool get isValid {
    return fullName.trim().isNotEmpty &&
        phoneNumber.trim().isNotEmpty;
  }

  // نسخة معدلة من بيانات النزيل
  Guest copyWith({
    String? fullName,
    String? phoneNumber,
    String? nationalId,
    String? address,
    String? notes,
  }) {
    return Guest(
      id: id,
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      nationalId: nationalId ?? this.nationalId,
      address: address ?? this.address,
      notes: notes ?? this.notes,
      createdAt: createdAt,
      createdBy: createdBy,
    );
  }

  // تحويل البيانات إلى صيغة قابلة للحفظ
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'nationalId': nationalId,
      'address': address,
      'notes': notes,
      'createdAt': createdAt.toIso8601String(),
      'createdBy': createdBy,
    };
  }

  // استرجاع بيانات النزيل
  factory Guest.fromJson(Map<String, dynamic> json) {
    return Guest(
      id: json['id'] as String,
      fullName: json['fullName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      nationalId: json['nationalId'] as String?,
      address: json['address'] as String?,
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      createdBy: json['createdBy'] as String,
    );
  }
}
