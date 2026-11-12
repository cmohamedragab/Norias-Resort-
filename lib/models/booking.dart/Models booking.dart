
enum PaymentMethod {
  cash,
  visa,
  instaPay,
  bankTransfer,
}

class Payment {
  final String id;
  final double amount;
  final PaymentMethod method;
  final DateTime date;
  final String? notes;

  const Payment({
    required this.id,
    required this.amount,
    required this.method,
    required this.date,
    this.notes,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'amount': amount,
        'method': method.name,
        'date': date.toIso8601String(),
        'notes': notes,
      };

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json['id'] as String,
      amount: (json['amount'] as num).toDouble(),
      method: PaymentMethod.values.firstWhere(
        (e) => e.name == json['method'],
        orElse: () => PaymentMethod.cash,
      ),
      date: DateTime.parse(json['date'] as String),
      notes: json['notes'] as String?,
    );
  }
}

class Booking {
  final String id;
  final String bookingNumber;
  final String? guestId;
  final String guestName;
  final String guestPhone;
  final int? roomNumber;
  final DateTime checkIn;
  final DateTime checkOut;
  final int adults;
  final int children;
  final double roomRate;
  final double discount;
  final List<Payment> payments;
  final String status;
  final String? notes;
  final DateTime createdAt;

  const Booking({
    required this.id,
    required this.bookingNumber,
    this.guestId,
    required this.guestName,
    required this.guestPhone,
    this.roomNumber,
    required this.checkIn,
    required this.checkOut,
    this.adults = 1,
    this.children = 0,
    required this.roomRate,
    this.discount = 0,
    this.payments = const [],
    this.status = 'confirmed',
    this.notes,
    required this.createdAt,
  });

  double get totalAmount {
    final nights = checkOut.difference(checkIn).inDays;
    final total = nights * roomRate - discount;
    return total < 0 ? 0 : total;
  }

  double get paidAmount {
    return payments.fold<double>(
      0.0,
      (sum, payment) => sum + payment.amount,
    );
  }

  double get remainingAmount {
    final remaining = totalAmount - paidAmount;
    return remaining > 0 ? remaining : 0;
  }

  int get nights => checkOut.difference(checkIn).inDays;

  Booking copyWith({
    String? guestId,
    String? guestName,
    String? guestPhone,
    int? roomNumber,
    DateTime? checkIn,
    DateTime? checkOut,
    int? adults,
    int? children,
    double? roomRate,
    double? discount,
    List<Payment>? payments,
    String? status,
    String? notes,
  }) {
    return Booking(
      id: id,
      bookingNumber: bookingNumber,
      guestId: guestId ?? this.guestId,
      guestName: guestName ?? this.guestName,
      guestPhone: guestPhone ?? this.guestPhone,
      roomNumber: roomNumber ?? this.roomNumber,
      checkIn: checkIn ?? this.checkIn,
      checkOut: checkOut ?? this.checkOut,
      adults: adults ?? this.adults,
      children: children ?? this.children,
      roomRate: roomRate ?? this.roomRate,
      discount: discount ?? this.discount,
      payments: payments ?? this.payments,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      createdAt: createdAt,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'bookingNumber': bookingNumber,
        'guestId': guestId,
        'guestName': guestName,
        'guestPhone': guestPhone,
        'roomNumber': roomNumber,
        'checkIn': checkIn.toIso8601String(),
        'checkOut': checkOut.toIso8601String(),
        'adults': adults,
        'children': children,
        'roomRate': roomRate,
        'discount': discount,
        'payments': payments.map((p) => p.toJson()).toList(),
        'status': status,
        'notes': notes,
        'createdAt': createdAt.toIso8601String(),
      };

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'] as String,
      bookingNumber: json['bookingNumber'] as String,
      guestId: json['guestId'] as String?,
      guestName: json['guestName'] as String,
      guestPhone: json['guestPhone'] as String,
      roomNumber: json['roomNumber'] as int?,
      checkIn: DateTime.parse(json['checkIn'] as String),
      checkOut: DateTime.parse(json['checkOut'] as String),
      adults: json['adults'] as int? ?? 1,
      children: json['children'] as int? ?? 0,
      roomRate: (json['roomRate'] as num).toDouble(),
      discount: (json['discount'] as num?)?.toDouble() ?? 0,
      payments: (json['payments'] as List<dynamic>? ?? [])
          .map((p) => Payment.fromJson(
                Map<String, dynamic>.from(p as Map),
              ))
          .toList(),
      status: json['status'] as String? ?? 'confirmed',
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }
}
