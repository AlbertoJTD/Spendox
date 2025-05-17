import 'package:flutter/material.dart';

import 'package:spendox/models/expense.dart';

class NewExpense extends StatefulWidget {
  NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  // var _enteredTitle = '';
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.food;

  void _presentDatePicker() async {
    final initialDate = DateTime.now();
    final firstDate = DateTime(initialDate.year - 1, initialDate.month, initialDate.day);

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: initialDate,
    );

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;

    if (_titleController.text.trim().isEmpty || amountIsInvalid || _selectedDate == null || _selectedCategory == null) {
      showDialog(
        context: context,
        builder: (contextObject) => AlertDialog(
          title: const Text('Invalid input'),
          content: const Text('Please make sure a valid title, amount and date was entered.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(contextObject);
              },
              child: Text('Okay')
            ),
          ]
        )
      );

      return;
    }

    Expense newExpense = Expense(
      title: _titleController.text,
      amount: enteredAmount,
      date: _selectedDate!,
      category: _selectedCategory
    );

    widget.onAddExpense(newExpense);
    Navigator.pop(context);
  }

  // void _saveTitleInput(String inputValue) {
  //   _enteredTitle = inputValue;
  // }
  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(26),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              label: Text('Title'),
            ),
          ),

          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text('Amount'),
                    prefixText: '\$',
                  ),
                ),
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_selectedDate == null
                      ? 'No date selected'
                      : dateFormatter.format(_selectedDate!), // '!' This won't be null
                    ),
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: Icon(Icons.calendar_month)
                    )
                  ],
                ),
              )
            ],
          ),

          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values.map((category) =>
                  DropdownMenuItem(
                    value: category,
                    child: Text(category.name.toUpperCase()),
                  )
                ).toList(),
                onChanged: (value) {
                  if (value == null) return;

                  setState(() {
                    _selectedCategory = value;
                  });
                }
              ),
            ],
          ),

          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel')
              ),

              ElevatedButton(
                onPressed: _submitExpenseData,
                child: const Text('Save Expense')
              ),
            ],
          )
        ],
      )
    );
  }
}
