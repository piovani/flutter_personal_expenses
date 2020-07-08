import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_personal_expenses/models/transaction.dart';

class Chart extends StatelessWidget {

  final List<Transaction> recentTranssaction;

  Chart(this.recentTranssaction);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) => {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.00;

      for (var i = 0; i < recentTranssaction.length; i++) {
        bool sameDay = recentTranssaction[i].date.day == weekDay.day;
        bool sameMoth = recentTranssaction[i].date.month == weekDay.month;
        bool sameYear = recentTranssaction[i].date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += recentTranssaction[i].value;
        }
      }

      print('WORKING');

      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[],
      ),
    );
  }
}
