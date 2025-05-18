import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Uuid uuid = const Uuid();
final dateFormatter = DateFormat.yMd();

enum Category {
  food,
  travel,
  leisure,
  work,
  services,
  streaming,
  clothes
}
const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
  Category.services:  Icons.store_mall_directory,
  Category.streaming: Icons.tv,
  Category.clothes: Icons.shopify_sharp
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formatDate {
    return dateFormatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses
  });

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double total = 0;

    for (final expense in expenses) {
      total += expense.amount;
    }
    return 0.0;
  }
}