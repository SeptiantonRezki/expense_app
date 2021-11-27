import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum CategoryType {
  primer,
  sekunder,
  tersier,
}

String getCategoryTypeString(CategoryType type) {
  switch (type) {
    case CategoryType.primer:
      return "Primer";
    case CategoryType.sekunder:
      return "Sekunder";
    default:
      return "Tersier";
  }
}

CategoryType getCategoryType(String category) {
  switch (category) {
    case "Primer":
      return CategoryType.primer;
    case "Sekunder":
      return CategoryType.sekunder;
    default:
      return CategoryType.tersier;
  }
}

Color getCategoryColor(CategoryType type) {
  switch (type) {
    case CategoryType.primer:
      return Colors.blue.shade400;
    case CategoryType.sekunder:
      return Colors.orange.shade400;
    default:
      return Colors.red.shade400;
  }
}
