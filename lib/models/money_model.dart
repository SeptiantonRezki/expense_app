import '../enum/category_type.dart';

const Map _dateTimeMoney = {
  "day": "",
  "month": "",
  "year": "",
};

class MoneyModel {
  final String id;
  final String label;
  final double money;
  final CategoryType categoryType;
  final Map dateTime;

  MoneyModel({
    required this.id,
    required this.label,
    required this.money,
    required this.categoryType,
    this.dateTime = _dateTimeMoney,
  });

  MoneyModel copyWith({
    String? newId,
    String? newLabel,
    double? newMoney,
    CategoryType? newCategoryType,
    Map? newDateTime,
  }) {
    return MoneyModel(
      id: newId ?? id,
      label: newLabel ?? label,
      money: newMoney ?? money,
      categoryType: newCategoryType ?? categoryType,
      dateTime: newDateTime ?? dateTime,
    );
  }
}
