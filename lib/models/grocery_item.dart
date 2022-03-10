import 'package:flutter/painting.dart';

enum Importance {
  low,
  medium,
  high,
}

class GroceryItem {
  final String? id;
  final String? name;
  final Importance? importance;
  final int? quantity;
  final Color? color;
  final DateTime? date;
  final bool? isComplete;

  GroceryItem(
      {this.id,
      this.name,
      this.importance,
      this.color,
      this.quantity,
      this.isComplete = false,
      this.date});

  GroceryItem copyWith({
    String? id,
    String? name,
    Importance? importance,
    int? quantity,
    Color? color,
    DateTime? date,
    bool? isComplete,
  }) {
    return GroceryItem(
        id: id ?? this.id,
        name: name ?? this.name,
        importance: importance ?? this.importance,
        color: color ?? this.color,
        quantity: quantity ?? this.quantity,
        date: date ?? this.date,
        isComplete: isComplete ?? this.isComplete);
  }
}
