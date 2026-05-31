import 'package:care_paws/modules/home/services/pet_record/health_record/model/medical_history_model.dart';
import 'package:care_paws/modules/home/services/pet_record/health_record/model/pet_model.dart';
import 'package:care_paws/modules/home/services/pet_record/health_record/model/prescription_model.dart';
import 'package:care_paws/modules/home/services/pet_record/health_record/model/vaccination_model.dart';
import 'package:care_paws/modules/home/services/pet_record/health_record/model/visit_model.dart';

class DummyData {

  static List<Pet> pets = [

    Pet(
      name: "Tuffy",
      vaccinations: [
        Vaccination(
          name: "Rabies",
          date: "01/03/2020",
          dueDate: "01/03/2021",
          reminder: true,
        ),
        Vaccination(
          name: "Bordetella",
          date: "01/03/2020",
          dueDate: "01/03/2021",
          reminder: true,
        ),
        Vaccination(
          name: "Rabies",
          date: "01/03/2020",
          dueDate: "01/03/2021",
          reminder: true,
        ),
        Vaccination(
          name: "Rabies",
          date: "01/03/2020",
          dueDate: "01/03/2021",
          reminder: true,
        ),
      ],
      medicalHistory: [
        MedicalHistory(
          pastIllness: "Fever",
          treatments: "Medication",
          surgeries: "None",
          allergies: "Peanut",
        ),
      ],
      prescriptions: [
        Prescription(
          name: "Blood Test",
          date: "01/03/2020",
          fileUrl: "",
        ),
      ],
      visits: [
        VetVisit(
          name: "Skin Allergy",
          date: "01/03/2020",
          notes: "Avoid peanut butter",
        ),
      ],
    ),


    Pet(
      name: "Tuffy",
      vaccinations: [
        Vaccination(
          name: "Bordetella",
          date: "01/03/2020",
          dueDate: "01/03/2021",
          reminder: true,
        ),
        Vaccination(
          name: "Rabies",
          date: "01/03/2020",
          dueDate: "01/03/2021",
          reminder: true,
        ),
      ],
      medicalHistory: [
        MedicalHistory(
          pastIllness: "Fever",
          treatments: "Medication",
          surgeries: "None",
          allergies: "Peanut",
        ),
      ],
      prescriptions: [
        Prescription(
          name: "Blood Test",
          date: "01/03/2020",
          fileUrl: "",
        ),
      ],
      visits: [
        VetVisit(
          name: "Skin Allergy",
          date: "01/03/2020",
          notes: "Avoid peanut butter",
        ),
      ],
    ),
  ];
}