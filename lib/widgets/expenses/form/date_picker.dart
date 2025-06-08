import 'package:flutter/material.dart';

import 'package:spendox/models/expense.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({
    super.key,
    required this.selectedDate,
    required this.onDateChanged
  });

  final DateTime? selectedDate;
  final void Function(DateTime date) onDateChanged;

  Future<void> _presentDatePicker(BuildContext context) async {
    final initialDate = DateTime.now();
    final firstDate = DateTime(initialDate.year - 1, initialDate.month, initialDate.day);

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: initialDate,
    );

    if (pickedDate != null) {
      onDateChanged(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(selectedDate == null
          ? 'No date selected'
          : dateFormatter.format(selectedDate!),
        ),
        IconButton(
          onPressed: () => _presentDatePicker(context),
          icon: const Icon(Icons.calendar_month)
        )
      ],
    );
  }
}