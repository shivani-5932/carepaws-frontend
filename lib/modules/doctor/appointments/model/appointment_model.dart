class AppointmentModel {
  final String ownerName;
  final String petName;
  final String dateTime;
  final String price;
  final String status; // pending, confirmed, cancelled

  AppointmentModel({
    required this.ownerName,
    required this.petName,
    required this.dateTime,
    required this.price,
    required this.status,
  });
}