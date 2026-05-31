import 'package:flutter/material.dart';

class DrawingController extends ChangeNotifier {

  List<Offset?> points = [];

  Color selectedColor = Colors.red;
  double strokeWidth = 4;

  void addPoint(Offset point) {
    points.add(point);
    notifyListeners();
  }

  void endLine() {
    points.add(null);
    notifyListeners();
  }

  void clear() {
    points.clear();
    notifyListeners();
  }

  void undo() {
    if (points.isNotEmpty) {
      points.removeLast();
      notifyListeners();
    }
  }

  void changeColor(Color color) {
    selectedColor = color;
    notifyListeners();
  }

  void changeStroke(double value) {
    strokeWidth = value;
    notifyListeners();
  }
}