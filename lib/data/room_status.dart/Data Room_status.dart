
import 'package:flutter/material.dart';

enum RoomStatus {
  available,
  occupied,
  reserved,
  maintenance,
}

extension RoomStatusDetails on RoomStatus {
  String get arabicName {
    switch (this) {
      case RoomStatus.available:
        return 'متاحة';
      case RoomStatus.occupied:
        return 'مشغولة';
      case RoomStatus.reserved:
        return 'محجوزة';
      case RoomStatus.maintenance:
        return 'صيانة';
    }
  }

  Color get color {
    switch (this) {
      case RoomStatus.available:
        return Colors.green;
      case RoomStatus.occupied:
        return Colors.red;
      case RoomStatus.reserved:
        return Colors.amber;
      case RoomStatus.maintenance:
        return Colors.blue;
    }
  }

  IconData get icon {
    switch (this) {
      case RoomStatus.available:
        return Icons.check_circle;
      case RoomStatus.occupied:
        return Icons.person;
      case RoomStatus.reserved:
        return Icons.bookmark;
      case RoomStatus.maintenance:
        return Icons.build;
    }
  }
}
