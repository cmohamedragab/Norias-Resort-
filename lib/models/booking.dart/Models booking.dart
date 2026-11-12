
enum PaymentMethod {
  cash,
  visa,
  instaPay,
  bankTransfer,
}

extension PaymentMethodDetails on PaymentMethod {
  String get arabicName {
    switch (this) {
      case PaymentMethod.cash:
        return 'نقدي';
      case PaymentMethod.visa:
        return 'فيزا';
      case PaymentMethod.instaPay:
        return 'إنستاباي';
      case PaymentMethod.bankTransfer:
        return 'تحويل بنكي';
    }
  }
}

enum BookingStatus {
  provisional,
  confirmed,
  checkedIn,
  checkedOut,
  cancelled,
}

class BookingPayment {
  final String id;
  final double amount;
  final PaymentMethod method;
  final DateTime paymentDate;
  final String receivedBy;
  final String? notes;

  const BookingPayment({
    required this.id,
    required this.amount,
    required this.method,
    required this.paymentDate,
    required this.receivedBy,
    this.notes,
  });
}

class Booking {
  final String bookingNumber;
  final String guestName;
  final String guestPhone;
  final String? roomNumber;

  final DateTime arrivalDate;
  final DateTime departureDate;

  final int adults;
  final int children;

  final double totalAmount;
  final double discount;

  final BookingStatus status;
  final List<BookingPayment> payments;

  final DateTime createdAt;
  final String createdBy;

  const Booking({
    required this.bookingNumber,
    required this.guestName,
    required this.guestPhone,
    this.roomNumber,
    required this.arrivalDate,
    required this.departureDate,
    this.adults = 1,
    this.children = 0,
    required this.totalAmount,
    this.discount = 0,
    this.status = BookingStatus.provisional,
    this.payments = const [],
    required this.createdAt,
    required this.createdBy,
  });

  // إجمالي المبلغ بعد الخصم
  double get netAmount => totalAmount - discount;

  // إجمالي المدفوع
  double get paidAmount {
    return payments.fold<double>(
      0.0,
      (sum, payment) => sum + payment.amount,
    );
  }

  // المبلغ المتبقي
  double get remainingAmount => netAmount - paidAmount;

  // عدد الليالي
  int get nights =>
      departureDate.difference(arrivalDate).inDays;

  // إضافة دفعة جديدة
  Booking addPayment(BookingPayment payment) {
    if (payment.amount <= 0) {
      throw ArgumentError('مبلغ الدفع يجب أن يكون أكبر من صفر');
    }

    if (payment.amount > remainingAmount) {
      throw ArgumentError('مبلغ الدفع أكبر من المتبقي');
    }

    return copyWith(
      payments: [...payments, payment],
    );
  }

  Booking copyWith({
    String? guestName,
    String? guestPhone,
    String? roomNumber,
    DateTime? arrivalDate,
    DateTime? departureDate,
    int? adults,
    int? children,
    double? totalAmount,
    double? discount,
    BookingStatus? status,
    List<BookingPayment>? payments,
  }) {
    return Booking(
      bookingNumber: bookingNumber,
      guestName: guestName ?? this.guestName,
      guestPhone: guestPhone ?? this.guestPhone,
      roomNumber: roomNumber ?? this.roomNumber,
      arrivalDate: arrivalDate ?? this.arrivalDate,
      departureDate: departureDate ?? this.departureDate,
      adults: adults ?? this.adults,
      children: children ?? this.children,
      totalAmount: totalAmount ?? this.totalAmount,
      discount: discount ?? this.discount,
      status: status ?? this.status,
      payments: payments ?? this.payments,
      createdAt: createdAt,
      createdBy: createdBy,
    );
  }
}
