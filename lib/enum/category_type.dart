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
