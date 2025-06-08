import 'package:flutter/material.dart';

class AmountInput extends StatelessWidget {
  const AmountInput({
    super.key,
    required this.amountController
  });

  final TextEditingController amountController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: amountController,
      maxLength: 10,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        label: Text('Amount'),
        prefixText: '\$',
      ),
    );
  }
}