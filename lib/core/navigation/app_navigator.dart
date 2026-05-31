import 'package:care_paws/features/services/dashboard_type.dart';
import 'package:care_paws/features/services/pet_record_type.dart';
import 'package:care_paws/modules/doctor/appointments/view/appointment_screen.dart';
import 'package:care_paws/modules/doctor/doctor_wallet/view/wallet_screen.dart';
import 'package:care_paws/modules/doctor/growth/view/growth_screen.dart';
import 'package:care_paws/modules/home/appointment_booking/add_pet/add_pet_screen.dart';
import 'package:care_paws/modules/home/services/caretaker/view/caretaker_screen.dart';
import 'package:care_paws/modules/home/services/grooming/grooming_screen.dart';
import 'package:care_paws/modules/home/services/pet_events/pet_events_screen.dart';
import 'package:care_paws/modules/home/services/pet_record/ai_insight/ai_insight_screen.dart';
import 'package:care_paws/modules/home/services/pet_record/ai_insight/behavior_insights/view/behavior_insight_screen.dart';
import 'package:care_paws/modules/home/services/pet_record/ai_insight/health_analysis/health_analysis_screen.dart';
import 'package:care_paws/modules/home/services/pet_record/ai_insight/risk_alert/risk_alert_screen.dart';
import 'package:care_paws/modules/home/services/pet_record/ai_insight/symptom_checker/view/symptom_checker_screen.dart';
import 'package:care_paws/modules/home/services/pet_record/health_record/health_record_screen.dart';
import 'package:care_paws/modules/home/services/pet_record/health_record/view/medical_history/medical_notes_screen.dart';
import 'package:care_paws/modules/home/services/pet_record/health_record/view/prescription/prescription_list_screen.dart';
import 'package:care_paws/modules/home/services/pet_record/health_record/view/prescription/upload_prescription_screen.dart';
import 'package:care_paws/modules/home/services/pet_record/health_record/view/vaccination/add_vaccination_screen.dart';
import 'package:care_paws/modules/home/services/pet_record/health_record/view/vaccination/vaccination_list_screen.dart';
import 'package:care_paws/modules/home/services/pet_record/health_record/view/vet_visit/add_vet_visit_screen.dart';
import 'package:care_paws/modules/home/services/pet_record/health_record/view/vet_visit/vet_visit_screen.dart';
import 'package:care_paws/modules/home/services/pet_record/pet_diet_management/daily_activity/view/activity_screen.dart';
import 'package:care_paws/modules/home/services/pet_record/pet_diet_management/diet_plan/diet_plan_screen.dart';
import 'package:care_paws/modules/home/services/pet_record/pet_diet_management/pet_diet_management_screen.dart';
import 'package:care_paws/modules/home/services/pet_record/pet_diet_management/water_intake/water_intake_screen.dart';
import 'package:care_paws/modules/home/services/pet_record/pet_record_screen.dart';
import 'package:care_paws/modules/home/services/pharmacy/pharmacy_screen.dart';
import 'package:care_paws/modules/home/services/vet_consult/view/vet_consult_screen.dart';
import 'package:care_paws/modules/profile/apc/view/appointment_screen.dart';
import 'package:care_paws/modules/profile/apc/view/consultation_screen.dart';
import 'package:care_paws/modules/profile/apc/view/payment_screen.dart';
import 'package:care_paws/modules/profile/apc/view/rescue_screen.dart';
import 'package:care_paws/modules/profile/settings/view/settings_screen.dart';
import 'package:flutter/material.dart';
import '../../features/services/service_type.dart'; // adjust path
import 'package:get/get.dart';


class AppNavigator {

  /// Named route push
  static void push(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
  }

  /// Replace route
  static void replace(BuildContext context, String route) {
    Navigator.pushReplacementNamed(context, route);
  }

  /// Push with data
  static void pushWithData(
      BuildContext context,
      String route,
      Object? arguments,
      ) {
    Navigator.pushNamed(
      context,
      route,
      arguments: arguments,
    );
  }


  /// Pop screen
  static void pop(BuildContext context) {
    Navigator.pop(context);
  }

  /// 🔥 DASHBOARD NAVIGATION (NEW)
  static void navigateToDashboard(BuildContext context, DashboardType type) {

    switch (type) {

      case DashboardType.appointments:
        Get.to(() => AppointmentScreen());
        break;

      case DashboardType.growth:
        Get.to(() => GrowthScreen());
        break;

      case DashboardType.wallet:
        Get.to(() => WalletScreen());
        break;

      case DashboardType.leave:
      // TODO future
        break;
    }
  }
  ///PROFILE NAVIGATION
  static void handleNavigation(String title) {
    switch (title) {
      case "My Appointments":
        Get.to(() => ProfileAppointmentScreen());
        break;

      case "Payments":
        Get.to(() => PaymentScreen());
        break;

      case "Consultation":
        Get.to(() => ConsultationScreen());
        break;

      case "My Rescue":
        Get.to(() => MyRescueScreen());
        break;

      case "Settings":
        Get.to(() => SettingsScreen());
        break;
    }
  }

  /// 🔥 PET RECORD NAVIGATION (NEW - DO NOT MODIFY EXISTING CODE)
  static bool isPetAdded = false; // later replace with controller

  static void navigateToPetFeature(PetFeature feature) {

    /// ✅ STEP 1: CHECK PET ADDED
    // if (!isPetAdded) {
    //   Get.to(() => const AddPetScreen());
    //   isPetAdded = true; // temporary
    //   return;
    // }

    /// ✅ STEP 2: ROUTING
    switch (feature) {

    /// MAIN MODULES
      case PetFeature.healthRecord:
        Get.to(() => const HealthRecordScreen());
        break;

      case PetFeature.aiInsight:
        Get.to(() => const AiInsightScreen());
        break;

      case PetFeature.dietManagement:
        Get.to(() => const PetDietManagementScreen());
        break;

    /// HEALTH FEATURES (ADD → THEN LIST FLOW)
      case PetFeature.vaccination:
        Get.to(() => const AddVaccinationScreen());
            // ?.then((_) {
          // Get.to(() => const VaccinationRecordScreen());
        // });
        break;

      case PetFeature.prescription:
        Get.to(() => const UploadPrescriptionScreen());
        // ?.then((_) {
        //   Get.to(() => const PrescriptionRecordScreen());
        // });
        break;

      case PetFeature.vetVisit:
        Get.to(() => const AddVetVisitScreen());
        // ?.then((_) {
        //   Get.to(() => const VetVisitLogsScreen());
        // });
        break;

      case PetFeature.medicalHistory:
        Get.to(() => const MedicalHistoryNotesScreen());
        break;

    /// AI FEATURES
      case PetFeature.riskAlert:
        Get.to(() => const RiskAlertScreen());
        break;

      case PetFeature.behaviorInsight:
        Get.to(() => const BehaviorInsightScreen());
        break;

      case PetFeature.healthAnalysis:
        Get.to(() => const HealthAnalysisScreen());
        break;

      case PetFeature.symptomChecker:
        Get.to(() => const SymptomCheckerScreen());
        break;

    /// DIET FEATURES
      case PetFeature.dietPlan:
        Get.to(() => const DietPlanScreen());
        break;

      case PetFeature.waterIntake:
        Get.to(() => const WaterIntakeScreen());
        break;

      case PetFeature.dailyActivities:
        Get.to(() => const DailyActivityScreen());
        break;
    }
  }


  /// 🔥 SERVICE BASED NAVIGATION (IMPORTANT FOR YOU)
  static void navigateToService(BuildContext context, ServiceType type) {

    switch (type) {

      case ServiceType.vet:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) =>  VetConsultScreen(),
          ),
        );
        break;

      case ServiceType.record:
      // TODO
        Get.to(() => const PetRecordScreen());
        break;

      case ServiceType.grooming:
      // TODO
        Get.to(() => const GroomingScreen());
        break;

      case ServiceType.pharmacy:
      // TODO
        Get.to(() => const PharmacyScreen());
        break;

      case ServiceType.caretaker:
      // TODO
        Get.to(() => const CaretakerScreen());
        break;

      case ServiceType.events:
      // TODO
        Get.to(() => const PetEventsScreen());
        break;
    }
  }
}

