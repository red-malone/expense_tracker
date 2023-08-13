import 'package:expense_tracker/widgets/expense_list/expense_item.dart';
import 'package:flutter/material.dart';
import '../../models/expense.dart';

class Expenselist extends StatelessWidget {
  const Expenselist(
      {super.key, required this.expenses, required this.removeexpense});

  final void Function(Expense expense) removeexpense;
  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: ValueKey(
            expenses[index],
          ),
          onDismissed: (direction) {
            removeexpense(expenses[index]);
          },
          child: ExpenseItem(expense: expenses[index]),
        );
      },
    );
  }
}
