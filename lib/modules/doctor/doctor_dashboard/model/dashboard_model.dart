import 'package:care_paws/features/services/dashboard_type.dart';

class DashboardItem {
  final String title;
  final String icon;
  final DashboardType type;

  DashboardItem({
    required this.title,
    required this.icon,
    required this.type,
  });
}