import 'package:flutter/material.dart';

import 'package:spendox/models/expense.dart';

class DatePicker extends StatefulWidget {
  DatePicker({
    super.key,
    required this.selectedDate,
    required this.onDateChanged
  });

  final DateTime? selectedDate;
  final void Function(DateTime date) onDateChanged;

  @override
  State<StatefulWidget> createState() {
    return _DatePickerState();
  }
}

class _DatePickerState extends State<DatePicker> {
  void _presentDatePicker() async {
    final initialDate = DateTime.now();
    final firstDate = DateTime(initialDate.year - 1, initialDate.month, initialDate.day);

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: initialDate,
    );

    if (pickedDate != null) {
      widget.onDateChanged(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(widget.selectedDate == null
          ? 'No date selected'
          : dateFormatter.format(widget.selectedDate!),
        ),
        IconButton(
          onPressed: _presentDatePicker,
          icon: Icon(Icons.calendar_month)
        )
      ],
    );
  }
}