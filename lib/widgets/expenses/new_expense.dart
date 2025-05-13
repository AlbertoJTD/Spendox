import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(26),
      child: Column(
        children: [
          TextField(
            maxLength: 50,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              label: Text('Title'),
              // hintText: 'Enter a title',
              // border: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(8),
              //   borderSide: BorderSide(
              //     color: Colors.black,
              //     width: 1,
              //   ),
              // ),
            ),
          ),
        ],
      )
    );
  }
}
