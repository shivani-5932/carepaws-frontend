import 'package:flutter/material.dart';
import '../model/growth_model.dart';

class GrowthController extends ChangeNotifier {

  int selectedTab = 0;

  List<String> tabs = ["Weekly", "Monthly", "6M", "Yearly"];

  Map<int, GrowthModel> data = {
    0: GrowthModel(
      earnings: [1600,1700,1800,1900,2500,2000,2600],
      appointments: [1,2,3,4,6,5,4],
      totalEarnings: 12600,
      patients: 60,
    ),
    1: GrowthModel(
      earnings: [2000,2200,2400,2600,2800,3000,3200],
      appointments: [2,3,4,5,6,7,8],
      totalEarnings: 22000,
      patients: 120,
    ),
  };

  GrowthModel get current => data[selectedTab] ?? data[0]!;

  void changeTab(int index) {
    selectedTab = index;
    notifyListeners();
  }
}