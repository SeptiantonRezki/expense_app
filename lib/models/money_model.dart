import 'package:intl/intl.dart';

import '../enum/category_type.dart';

class MoneyModel {
  final String id;
  final String label;
  final double money;
  final CategoryType categoryType;
  final String dateTime;

  MoneyModel({
    required this.id,
    required this.label,
    required this.money,
    required this.categoryType,
    required this.dateTime,
  });

  MoneyModel copyWith({
    String? newId,
    String? newLabel,
    double? newMoney,
    CategoryType? newCategoryType,
    String? newDateTime,
  }) {
    return MoneyModel(
      id: newId ?? id,
      label: newLabel ?? label,
      money: newMoney ?? money,
      categoryType: newCategoryType ?? categoryType,
      dateTime: newDateTime ?? dateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "label": label,
      "money": money,
      "categoryType": categoryType,
      "dateTime": dateTime,
    };
  }
}

String getMoneyFormatted(double money) {
  return NumberFormat.compactCurrency(
    decimalDigits: 2,
    symbol: "",
  ).format(money);
}
