import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formatter =DateFormat('dd/MM/yyyy');

const uuid = Uuid();

enum Category {
  food,
  work,
  transportation,
  bills,
  entertainment,
  other,
}

const categoryicons = {
  Category.food:Icons.lunch_dining,
  Category.work:Icons.work,
  Category.transportation:Icons.car_rental,
  Category.bills:Icons.money,
  Category.entertainment:Icons.sports_esports,
  Category.other:Icons.receipt,
};

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  String get formattedDate{
    return formatter.format(date);
  }
}
