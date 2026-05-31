import 'package:flutter/material.dart';
import 'package:care_paws/features/services/dashboard_type.dart';
import '../model/dashboard_model.dart';

class DoctorDashboardController extends ChangeNotifier {

  String doctorName = "Dr. Varun Gupta";

  List<DashboardItem> menuItems = [

    DashboardItem(
      title: "Appointments",
      icon: "assets/icons/appointments.png",
      type: DashboardType.appointments,
    ),

    DashboardItem(
      title: "Growth",
      icon: "assets/icons/growth.png",
      type: DashboardType.growth,
    ),

    DashboardItem(
      title: "Urgent Leave",
      icon: "assets/icons/leave.png",
      type: DashboardType.leave,
    ),

    DashboardItem(
      title: "Doctor Wallet",
      icon: "assets/icons/wallet.png",
      type: DashboardType.wallet,
    ),
  ];
}