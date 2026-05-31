class PaymentModel {

  String selectedMethod = "";

  /// 🔥 booking data (previous screen se aayega)
  String doctorName = "Dr. Neha Prakash";
  String dateTime = "20 March 7:30 AM";
  String mode = "Video Call";

  double consultationFee = 569;
  double charges = 41;

  double get total => consultationFee + charges;
}