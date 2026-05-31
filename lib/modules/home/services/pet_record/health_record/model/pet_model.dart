import 'package:care_paws/modules/home/services/pet_record/health_record/model/medical_history_model.dart';
import 'package:care_paws/modules/home/services/pet_record/health_record/model/prescription_model.dart';
import 'package:care_paws/modules/home/services/pet_record/health_record/model/vaccination_model.dart';
import 'package:care_paws/modules/home/services/pet_record/health_record/model/visit_model.dart';

class Pet {
  final String name;

  final List<Vaccination> vaccinations;
  final List<MedicalHistory> medicalHistory;
  final List<Prescription> prescriptions;
  final List<VetVisit> visits;

  Pet({
    required this.name,
    required this.vaccinations,
    required this.medicalHistory,
    required this.prescriptions,
    required this.visits,
  });
}