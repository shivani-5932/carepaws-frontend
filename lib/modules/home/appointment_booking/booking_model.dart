class BookingModel {

  String selectedMode = "Video Call";
  int selectedDateIndex = 0;
  String selectedSlot = "";

  /// 🔥 leave day support
  List<bool> isLeave = [false, false, true, false, false];

  Map<String, List<String>> slots = {
    "Morning": [
      "7:30 AM","7:40 AM","7:56 AM",
      "8:10 AM","8:20 AM","8:30 AM",
      "8:45 AM","9:00 AM","9:15 AM"
    ],

    "Afternoon": [
      "12:30 PM","12:40 PM","12:56 PM",
      "1:10 PM","1:20 PM","1:30 PM",
      "2:45 PM","3:00 PM","3:15 PM"
    ],

    "Evening": [
      "5:30 PM","5:40 PM","5:56 PM",
      "6:10 PM","6:20 PM","6:30 PM",
      "7:45 PM","8:00 PM","8:15 PM"
    ],
  };
}