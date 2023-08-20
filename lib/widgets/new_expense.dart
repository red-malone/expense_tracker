import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expense_tracker/models/expense.dart';

final formatter = DateFormat('dd/MM/yyyy');

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.addexpense});

  final void Function(Expense expense) addexpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.work;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _datepicker() async {
    final present = DateTime.now();
    final firstdate = DateTime(present.year - 1, present.month, present.day);
    final pickeddate = await showDatePicker(
      context: context,
      initialDate: present,
      firstDate: firstdate,
      lastDate: present,
    );
    setState(() {
      _selectedDate = pickeddate;
    });
  }

  void _submitExpense() {
    final amount = double.tryParse(_amountController.text);
    final amountInvalid = amount == null || amount <= 0;
    if (_titleController.text.trim().isEmpty ||
        amountInvalid ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Invalid input"),
          content: const Text("Please enter valid input"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Okay"))
          ],
        ),
      );
      return;
    }

    widget.addexpense(Expense(
      title: _titleController.text,
      amount: amount,
      date: _selectedDate!,
      category: _selectedCategory,
    ));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final keyboard = MediaQuery.of(context).viewInsets.bottom;

    return LayoutBuilder(builder: (context,constraints) {
      final width = constraints.maxWidth;
      return SizedBox(
      height: double.infinity, 
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.fromLTRB(16, 45, 16, keyboard + 16),
            child: Column(
              children: [
                TextField(
                  controller: _titleController,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    label: Text('Title'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _amountController,
                        decoration: const InputDecoration(
                          prefix: Text("\$ "),
                          label: Text('Amount'),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(_selectedDate == null
                              ? "No Date"
                              : formatter.format(_selectedDate!)),
                          IconButton(
                              onPressed: () {
                                _datepicker();
                              },
                              icon: const Icon(Icons.calendar_month_sharp))
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DropdownButton(
                        value: _selectedCategory,
                        items: Category.values.map((category) {
                          return DropdownMenuItem(
                            value: category,
                            child: Text(category.name.toUpperCase()),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value == null) {
                            return;
                          }
                          setState(() {
                            _selectedCategory = value;
                          });
                        }),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Cancel"),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          _submitExpense();
                        },
                        child: const Text('Add Expense')),
                  ],
                )
              ],
            )),
      ),
    );
    });
  }
}
