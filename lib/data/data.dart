import '../enum/category_type.dart';
import '../models/money_model.dart';

final List<String> categoryTypeList = [
  getCategoryTypeString(CategoryType.primer),
  getCategoryTypeString(CategoryType.sekunder),
  getCategoryTypeString(CategoryType.tersier),
];

final expenseList = [
  MoneyModel(
    id: "id-03",
    label: "Wifi",
    money: 250000,
    categoryType: CategoryType.primer,
    dateTime: "11-11-2021",
  ).toMap(),
  MoneyModel(
    id: "id-04",
    label: "Pajak",
    money: 300000,
    categoryType: CategoryType.primer,
    dateTime: "12-11-2021",
  ).toMap(),
  MoneyModel(
    id: "id-05",
    label: "Makan",
    money: 70000,
    categoryType: CategoryType.primer,
    dateTime: "12-11-2021",
  ).toMap(),
  MoneyModel(
    id: "id-06",
    label: "Liburan",
    money: 500000,
    categoryType: CategoryType.primer,
    dateTime: "12-11-2021",
  ).toMap(),
  MoneyModel(
    id: "id-01",
    label: "Internet",
    money: 100000,
    categoryType: CategoryType.primer,
    dateTime: "10-11-2021",
  ).toMap(),
  MoneyModel(
    id: "id-02",
    label: "Pajak",
    money: 200000,
    categoryType: CategoryType.primer,
    dateTime: "11-11-2021",
  ).toMap(),
];
