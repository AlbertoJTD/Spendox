import 'package:flutter/material.dart';

import 'package:spendox/models/expense.dart';

class CategoriesDropdown extends StatelessWidget {
  const CategoriesDropdown({
    super.key,
    required this.selectedCategory,
    required this.onCategoryChanged,
  });

  final Category selectedCategory;
  final void Function(Category category) onCategoryChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: selectedCategory,
      items: Category.values.map((category) =>
        DropdownMenuItem(
          value: category,
          child: Text(category.name.toUpperCase()),
        )
      ).toList(),
      onChanged: (value) {
        if (value == null) return;

        onCategoryChanged(value);
      }
    );
  }
}
