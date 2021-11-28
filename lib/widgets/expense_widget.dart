import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

import '../enum/category_type.dart';
import '../models/money_model.dart';

class ExpenseWidget extends StatelessWidget {
  final Map<String, List<Map>> expenseMapList;
  final String selectedExpenseDate;

  const ExpenseWidget({
    Key? key,
    required this.expenseMapList,
    required this.selectedExpenseDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GroupedListView<dynamic, String>(
      elements: expenseMapList[selectedExpenseDate]!,
      groupBy: (item) => item["dateTime"],
      groupComparator: (value1, value2) => value2.compareTo(value1),
      itemComparator: (item1, item2) =>
          item1["label"].compareTo(item2["label"]),
      order: GroupedListOrder.ASC,
      groupSeparatorBuilder: (String value) => Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
        child: Container(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey)))),
      ),
      itemBuilder: (c, item) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          child: ListTile(
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 8.0,
                  backgroundColor: getCategoryColor(item["categoryType"]),
                )
              ],
            ),
            title: Text(
              item["label"],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(item["dateTime"]),
            trailing: Text(
              "Rp ${getMoneyFormatted(item['money'])}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
