import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_personal_expenses/components/transaction_list.dart';
import 'transactions_form.dart';
import 'transactions_form.dart';
import '../models/transaction.dart';

class TransactionUser extends StatefulWidget {
  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Novo Tênis',
      value: 777.90,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Cacau show',
      value: 15.50,
      date: DateTime.now(),
    )
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionList(_transactions),
        TransactionForm(),
      ],
    );
  }
}
