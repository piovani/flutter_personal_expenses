import 'package:flutter/material.dart';
import 'package:flutter_personal_expenses/components/transactions_form.dart';
import 'package:flutter_personal_expenses/models/transaction.dart';

import 'dart:math';
import 'components/transactions_form.dart';
import 'components/transaction_list.dart';
import './models/transaction.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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
    ),
     Transaction(
      id: 't3',
      title: 'Cacau show',
      value: 78.10,
      date: DateTime.now(),
    ), 
  ];

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

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context, 
      builder: (_) {
        return TransactionForm(null);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('Gráfico'),
                elevation: 5,
              ),
            ),
            Column(
              children: <Widget>[
                TransactionForm(_addTransaction),
                TransactionList(_transactions),
              ],
            )
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
