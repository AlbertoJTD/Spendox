import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:spendox/models/expense.dart';

import 'package:spendox/widgets/expenses/form/title_input.dart';
import 'package:spendox/widgets/expenses/form/amount_input.dart';
import 'package:spendox/widgets/expenses/form/date_picker.dart';
import 'package:spendox/widgets/expenses/form/categories_dropdown.dart';

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

  void _showDialog() {
    if (Platform.isIOS) {
      showCupertinoDialog(
        context: context,
        builder: (contextObject) => CupertinoAlertDialog(
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
    } else {
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
    }
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;

    if (_titleController.text.trim().isEmpty || amountIsInvalid || _selectedDate == null || _selectedCategory == null) {
      _showDialog();
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
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

    return LayoutBuilder(
      builder: (ctx, constraints) {
        print(constraints.minHeight);
        print(constraints.maxHeight);
        print(constraints.minWidth);
        print(constraints.maxWidth);
        final width = constraints.maxWidth;

        return SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 48, 16, keyboardSpace + 20),
              child: Column(
                children: [
                  if (width >= 600)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TitleInput(
                            titleController: _titleController
                          )
                        ),
            
                        const SizedBox(width: 16),
            
                        Expanded(
                          child: AmountInput(
                            amountController: _amountController
                          )
                        )
                      ],
                    )
                  else
                    TitleInput(
                      titleController: _titleController
                    ),
            
                  if (width >= 600)
                    Row(
                      children: [
                        CategoriesDropdown(
                          selectedCategory: _selectedCategory,
                          onCategoryChanged: (category) {
                            setState(() {
                              _selectedCategory = category;
                            });
                          }
                        ),

                        const SizedBox(width: 16),

                        Expanded(
                          child: DatePicker(
                            selectedDate: _selectedDate,
                            onDateChanged: (date) {
                              setState(() {
                                _selectedDate = date;
                              });
                            }
                          )
                        ),
                      ],
                    )
                  else
                    Row(
                      children: [
                        Expanded(
                          child: AmountInput(
                            amountController: _amountController
                          )
                        ),
              
                        const SizedBox(width: 16),
              
                        Expanded(
                          child: DatePicker(
                            selectedDate: _selectedDate,
                            onDateChanged: (date) {
                              setState(() {
                                _selectedDate = date;
                              });
                            }
                          )
                        )
                      ],
                    ),
            
                  if (width < 600)
                    Row(
                      children: [
                        CategoriesDropdown(
                          selectedCategory: _selectedCategory,
                          onCategoryChanged: (category) {
                            setState(() {
                              _selectedCategory = category;
                            });
                          }
                        )
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
            ),
          ),
        );
      },
    );
  }
}
