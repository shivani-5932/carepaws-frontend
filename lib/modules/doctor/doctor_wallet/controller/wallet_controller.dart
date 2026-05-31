import 'package:flutter/material.dart';
import '../model/wallet_model.dart';

class WalletController extends ChangeNotifier {

  int selectedTab = 0;

  List<String> tabs = ["Weekly", "Monthly", "6M", "Yearly"];

  WalletModel wallet = WalletModel(
    total: 27000,
    today: 2000,
    week: 7500,
    month: 27000,
  );

  bool isEmpty = false; // 👈 change for empty state

  List<int> chartData = [1500, 1600, 1700, 1800, 2400, 2000, 2600];

  void changeTab(int index) {
    selectedTab = index;
    notifyListeners();
  }
}