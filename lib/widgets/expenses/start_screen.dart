import 'package:flutter/material.dart';

import 'package:spendox/models/expense.dart';
import 'package:spendox/widgets/expenses/expenses_list/expenses_list.dart';
import 'package:spendox/widgets/expenses/new_expense.dart';

class StartScreen extends StatefulWidget{
  const StartScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _StartScreenState();
  }
}

class _StartScreenState extends State<StartScreen> {
  final List<Expense> _registeredExpenses = [
    Expense(title: 'New Shoes', amount: 99.99, date: DateTime.now(), category: Category.clothes),
    Expense(title: 'Groceries', amount: 50.00, date: DateTime.now(), category: Category.food),
    Expense(title: 'Gym Membership', amount: 29.99, date: DateTime.now(), category: Category.leisure),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (contextObject) {
        return NewExpense(
          onAddExpense: _addExpense,
        );
      }
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spendox: Expense tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: Icon(Icons.add)
          ),
        ]
      ),
      body: Column(
        children: [
          const Text(
            'Here goes a chart'
          ),

          Expanded(
            child: ExpensesList(
              expenses: _registeredExpenses,
            ),
          )
        ],
      ),
    );
  }
}