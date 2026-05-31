import 'package:flutter/material.dart';
import '../model/appointment_model.dart';

class AppointmentController extends ChangeNotifier {

  int selectedTab = 0; // 0 today, 1 upcoming
  String selectedFilter = "All";

  List<AppointmentModel> allAppointments = [
    AppointmentModel(
      ownerName: "Mrs.Sunita Sharma",
      petName: "Snow (Dog)",
      dateTime: "18 March,2026 | 2:00 PM",
      price: "Rs 569",
      status: "pending",
    ),
    AppointmentModel(
      ownerName: "Mrs.Sunita Sharma",
      petName: "Snow (Dog)",
      dateTime: "18 March,2026 | 2:00 PM",
      price: "Rs 569",
      status: "confirmed",
    ),
    AppointmentModel(
      ownerName: "Mrs.Sunita Sharma",
      petName: "Snow (Dog)",
      dateTime: "18 March,2026 | 2:00 PM",
      price: "Rs 569",
      status: "cancelled",
    ),
  ];

  void changeTab(int index) {
    selectedTab = index;
    notifyListeners();
  }

  void changeFilter(String filter) {
    selectedFilter = filter;
    notifyListeners();
  }

  List<AppointmentModel> get filteredList {

    if (selectedFilter == "All") return allAppointments;

    return allAppointments
        .where((e) => e.status == selectedFilter.toLowerCase())
        .toList();
  }
}