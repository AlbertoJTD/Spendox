import 'package:flutter/material.dart';

import 'package:spendox/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (contextObject, index) {
        return Text(expenses[index].title);
      },
    );
  }
}