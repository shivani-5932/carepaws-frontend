class FilterModel {

  Map<String, List<String>> selected = {
    "Experience": [],
    "Availability": [],
    "Price": [],
    "Gender": [],
    "Language": [],
    "Facility": [],
    "Speciality": [],
  };

  /// 🔥 Check if ANY filter applied
  bool get isAnyFilterApplied {
    return selected.values.any((list) => list.isNotEmpty);
  }

  /// 🔥 Total selected count (optional badge)
  int get totalCount {
    int count = 0;
    for (var list in selected.values) {
      count += list.length;
    }
    return count;
  }

  /// 🔥 Clear all filters
  void clearAll() {
    selected.forEach((key, value) {
      value.clear();
    });
  }
}