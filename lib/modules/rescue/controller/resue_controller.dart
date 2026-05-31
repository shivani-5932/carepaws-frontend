import 'package:flutter/material.dart';
import '../model/rescue_model.dart';

class RescueController extends ChangeNotifier {
  final List<RescueModel> _rescues = [];

  List<RescueModel> get rescues => _rescues;

  RescueController() {
    _loadDummyData();
  }

  void _loadDummyData() {
    _rescues.addAll([
      RescueModel(
        name: "Rahul Sharma",
        phone: "9876543210",
        location: "Delhi",
        animal: "Dog",
        problem: "Injured leg",
        items: "Medical help",
      ),
      RescueModel(
        name: "Priya Verma",
        phone: "9123456780",
        location: "Mumbai",
        animal: "Cat",
        problem: "Stuck on tree",
        items: "Ladder needed",
      ),
    ]);
  }

  void addRescue(RescueModel rescue) {
    _rescues.insert(0, rescue);
    notifyListeners();
  }

  void markAsAdded(int index) {
    _rescues[index].isAdded = true;
    notifyListeners();
  }
}