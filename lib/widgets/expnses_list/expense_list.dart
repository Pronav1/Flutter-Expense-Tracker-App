import 'package:expense_tracker/models/expenses.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expnses_list/expense_item.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(
      {required this.expense, super.key, required this.onRemoveExpense});

  final List<Expenses> expense;
  final void Function(Expenses expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expense.length,
      itemBuilder: (ctx, index) => Dismissible(
          key: ValueKey(expense[index]),
          background: Container(color: Theme.of(context).colorScheme.error,
          margin : EdgeInsets.symmetric(horizontal: Theme.of(context).cardTheme.margin!.horizontal)
          ),
          
          onDismissed: (direction) {
            onRemoveExpense(expense[index]);
          },
          child: ExpenseItem(expenses: expense[index])),
    );
  }
}
