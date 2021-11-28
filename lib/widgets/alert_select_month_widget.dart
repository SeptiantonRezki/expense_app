import 'package:flutter/material.dart';
import 'package:spending_app/data/data.dart';
import 'package:spending_app/models/money_model.dart';

class AlertSelectMonthWidget extends StatelessWidget {
  const AlertSelectMonthWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return SingleChildScrollView(
        child: Column(
          children: expenseMapList.keys.map((item) {
            return ListTile(
              title: Text(getDateTimeString(item)),
              onTap: () {},
            );
          }).toList(),
        ),
      );
    });
  }
}
