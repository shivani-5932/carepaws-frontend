import 'package:flutter/material.dart';

class MyRequestController extends ChangeNotifier {
  List<int> selectedIndexes = [];
  bool isSelectionMode = false;

  void onLongPress(int index) {
    isSelectionMode = true;
    toggleSelection(index);
  }

  void toggleSelection(int index) {
    if (selectedIndexes.contains(index)) {
      selectedIndexes.remove(index);
    } else {
      selectedIndexes.add(index);
    }

    if (selectedIndexes.isEmpty) {
      isSelectionMode = false;
    }

    notifyListeners();
  }

  void clearSelection() {
    selectedIndexes.clear();
    isSelectionMode = false;
    notifyListeners();
  }

  void deleteSelected() {
    // 🔥 later API call here
    selectedIndexes.clear();
    isSelectionMode = false;
    notifyListeners();
  }
}