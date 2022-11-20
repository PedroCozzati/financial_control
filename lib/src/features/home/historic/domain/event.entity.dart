import 'package:financial_control/src/features/home/historic/domain/category.entity.dart';
import 'package:flutter/foundation.dart';

class EventEntity {
  final String value;
  final String description;
  final String type;
  final String category;
  final String date;

  EventEntity({
    required this.value,
    required this.description,
    required this.type,
    required this.category,
    required this.date,
  });
}
