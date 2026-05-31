import 'package:care_paws/modules/doctor/appointments/model/appointment_model.dart';
import 'package:care_paws/modules/profile/apc/model/profile_appointment_model.dart';
import 'package:flutter/material.dart';

List<ProfileAppointmentModel> dummyAppointments = [
  ProfileAppointmentModel(
    doctorName: "Dr. Neha Prakash",
    specialization: "General Vet",
    experience: "10 years EXP • MBBS, AFIH",
    dateTime: "18 March, 2026 | 2:00 PM",
    type: "Video Call | 25 min",
    price: "Rs 669",
    image: "https://i.pravatar.cc/150?img=5",
  ),
  ProfileAppointmentModel(
    doctorName: "Dr. Neha Prakash",
    specialization: "General Vet",
    experience: "10 years EXP • MBBS, AFIH",
    dateTime: "19 March, 2026 | 2:00 PM",
    type: "Call | 25 min",
    price: "Rs 300",
    image: "https://i.pravatar.cc/150?img=6",
  ),
];