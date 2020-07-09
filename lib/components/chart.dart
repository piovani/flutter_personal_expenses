import 'package:flutter/material.dart';
import 'package:flutter_personal_expenses/components/chart_bar.dart';
import 'package:intl/intl.dart';
import 'package:flutter_personal_expenses/models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTranssaction;

  Chart(this.recentTranssaction);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.00;

      for (var i = 0; i < recentTranssaction.length; i++) {
        bool sameDay = recentTranssaction[i].date.day == weekDay.day;
        bool sameMoth = recentTranssaction[i].date.month == weekDay.month;
        bool sameYear = recentTranssaction[i].date.year == weekDay.year;

        if (sameDay && sameMoth && sameYear) {
          totalSum += recentTranssaction[i].value;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    groupedTransactions;

    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupedTransactions.map((tr) {
          return ChartBar(
            label: tr['day'],
            value: tr['value'],
            percentage: 0,
          );
        }).toList(),
      ),
    );
  }
}
