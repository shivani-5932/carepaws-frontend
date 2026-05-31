import 'package:care_paws/modules/home/appointment_booking/booking_model.dart';

class BookingController {

  final model = BookingModel();

  void selectMode(String mode){
    model.selectedMode = mode;
  }

  void selectDate(int index){
    model.selectedDateIndex = index;
  }

  void selectSlot(String slot){
    model.selectedSlot = slot;
  }

  bool isLeaveDay(){
    return model.isLeave[model.selectedDateIndex];
  }
}

List<Map<String, dynamic>> doctors = [

{
"image": "assets/images/doc1.png",
"name": "Dr. Neha Prakash",
"speciality": "General Vet",
"exp": "10 years EXP",
"lang": "Hindi | Punjabi | English",
"distance": "110 km | Pathankot",
"rating": "4.9",
"price": "569",
"available": true,
"consultTime": "",
"modes": "Call | Video Call | Chat ",
},
];