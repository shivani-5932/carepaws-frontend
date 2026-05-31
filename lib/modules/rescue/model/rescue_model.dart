class RescueModel {
  final String name;
  final String phone;
  final String location;
  final String animal;
  final String problem;
  final String items;

  bool isAdded;

  RescueModel({
    required this.name,
    required this.phone,
    required this.location,
    required this.animal,
    required this.problem,
    required this.items,

    this.isAdded = false,
  });
}