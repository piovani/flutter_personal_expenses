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
    }).reversed.toList();
  }

  double get _weekTotalValue {
    return groupedTransactions.fold(0.0, (sum, tr) {
      return sum + tr['value'];
    });
  }

  @override
  Widget build(BuildContext context) {
    groupedTransactions;

    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactions.map((tr) {
            return Flexible(
                fit: FlexFit.loose,
                child: ChartBar(
                  label: tr['day'],
                  value: tr['value'],
                  percentage: (tr['value'] as double) / _weekTotalValue,
                ));
          }).toList(),
        ),
      ),
    );
  }
}
