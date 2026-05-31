import 'package:care_paws/core/navigation/app_routes.dart';
import 'package:care_paws/core/theme/app_theme.dart';
import 'package:care_paws/modules/auth/doctor_registration/view/clinic_verification_screen.dart';
import 'package:care_paws/modules/auth/doctor_registration/view/other_details1_screen.dart';
import 'package:care_paws/modules/auth/doctor_registration/view/other_details2_screen.dart';
import 'package:care_paws/modules/auth/doctor_registration/view/other_details3_screen.dart';
import 'package:care_paws/modules/auth/doctor_registration/view/registration_successfull_screen.dart';
import 'package:care_paws/modules/auth/doctor_registration/view/verification_screen.dart';
import 'package:care_paws/modules/auth/doctor_registration/view/verify_yourself_screen.dart';
import 'package:care_paws/modules/auth/doctor_registration/view/vet_license_screen.dart';
import 'package:care_paws/modules/auth/view/login_screen.dart';
import 'package:care_paws/modules/auth/view/otp_screen.dart';
import 'package:care_paws/modules/community/chat/view/chat_screen.dart';
import 'package:care_paws/modules/community/clips/clips_screen.dart';
import 'package:care_paws/modules/community/homepage/homepage_screen.dart';
import 'package:care_paws/modules/community/homepage/like_controller.dart';
import 'package:care_paws/modules/community/homepage/search_explore/search_screen.dart';
import 'package:care_paws/modules/community/messages/dm/view/dm_screen.dart';
import 'package:care_paws/modules/community/messages/view/message_screen.dart';
import 'package:care_paws/modules/community/notifications/view/notification_screen.dart';
import 'package:care_paws/modules/community/pet_profile/view/pet_profile_screen.dart';
import 'package:care_paws/modules/community/story_view/view/story_view_screen.dart';
import 'package:care_paws/modules/community/uploads/post_clip_upload/view/upload_soon_screen.dart';
import 'package:care_paws/modules/community/uploads/story_upload/view/story_upload_screen.dart';
import 'package:care_paws/modules/doctor/appointments/view/appointment_screen.dart';
import 'package:care_paws/modules/doctor/doctor_dashboard/view/doc_dashboard_screen.dart';
import 'package:care_paws/modules/doctor/doctor_wallet/view/wallet_screen.dart';
import 'package:care_paws/modules/doctor/growth/view/growth_screen.dart';
import 'package:care_paws/modules/home/appointment_booking/add_pet/add_pet_screen.dart';
import 'package:care_paws/modules/home/appointment_booking/booking_screen.dart';
import 'package:care_paws/modules/home/appointment_booking/booking_success/booking_success_screen.dart';
import 'package:care_paws/modules/home/calling/calling_screen.dart';
import 'package:care_paws/modules/home/online_consult/view/online_consult_screen.dart';
import 'package:care_paws/modules/home/services/caretaker/find/find_caretaker_screen.dart';
import 'package:care_paws/modules/home/services/caretaker/my_requests/view/my_request_screen.dart';
import 'package:care_paws/modules/home/services/caretaker/my_requests/view/request_detail_screen.dart';
import 'package:care_paws/modules/home/services/caretaker/view/caretaker_screen.dart';
import 'package:care_paws/modules/home/services/pet_record/ai_insight/behavior_insights/view/behavior_insight_screen.dart';
import 'package:care_paws/modules/home/services/pet_record/ai_insight/symptom_checker/view/symptom_checker_screen.dart';
import 'package:care_paws/modules/home/services/pet_record/pet_diet_management/daily_activity/view/activity_screen.dart';
import 'package:care_paws/modules/home/services/pet_record/pet_diet_management/diet_plan/diet_plan_screen.dart';
import 'package:care_paws/modules/home/services/pet_record/pet_diet_management/water_intake/water_intake_screen.dart';
import 'package:care_paws/modules/home/services/pet_record/pet_record_screen.dart';
import 'package:care_paws/modules/home/services/vet_consult/view/vet_consult_screen.dart';
import 'package:care_paws/modules/home/view/home_screen.dart';
import 'package:care_paws/modules/onboarding/view/onboarding_screen.dart';
import 'package:care_paws/modules/profile/apc/view/appointment_screen.dart';
import 'package:care_paws/modules/profile/apc/view/consultation_screen.dart';
import 'package:care_paws/modules/profile/apc/view/payment_screen.dart';
import 'package:care_paws/modules/profile/apc/view/rescue_screen.dart';
import 'package:care_paws/modules/profile/edit_profile/edit_profile_screen.dart';
import 'package:care_paws/modules/profile/settings/view/settings_screen.dart';
import 'package:care_paws/modules/profile/view/profile_screen.dart';
import 'package:care_paws/modules/rescue/controller/resue_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:care_paws/main_screen.dart';
import 'package:care_paws/modules/community/navbar/navigation_controller.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    Get.put(NavigationController());
    runApp(
        MultiProvider(
          providers: [

            /// 🔹 Rescue Controller
            ChangeNotifierProvider(
              create: (_) => RescueController(),
            ),

            /// 🔹 Like Controller
            ChangeNotifierProvider(
              create: (_) => LikeController(),
            ),

          ],

          child: const MyApp(),
        ),
    );
  }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   return  GetMaterialApp(

      debugShowCheckedModeBanner: false,

     theme: AppTheme.lightTheme,


      initialRoute: AppRoutes.onboarding

     ,

      routes: {

        AppRoutes.onboarding: (context) => const OnboardingScreen(),

        AppRoutes.login: (context) => const LoginScreen(),

        AppRoutes.otp: (context) => const OtpScreen(isVetFlow: false, verificationId: '',),

        AppRoutes.main: (context) =>  MainScreen(),

        AppRoutes.messages: (context) =>  MessageScreen(),

        AppRoutes.dm: (context) =>  ChatScreen(),

        AppRoutes.explore: (context) => const SearchScreen(),

        AppRoutes.clips: (context) =>  ClipsScreen(),

        AppRoutes.communityHome: (context) =>  CommunityHomePage(),

        AppRoutes.notifications: (_) => NotificationScreen(),

        AppRoutes.petProfile: (_) => const PetProfileScreen(),

        AppRoutes.home: (_) => const HomeScreen(),

        AppRoutes.vet: (_) =>  VetConsultScreen(),

        AppRoutes.onlineConsult: (_) =>  OnlineConsultScreen(),

        AppRoutes.upload: (_) =>  UploadSoonScreen(),

        AppRoutes.uploadStory: (_) =>  StoryUploadScreen(),

        AppRoutes.viewStory: (_) =>  StoryViewScreen(),

        AppRoutes.videoCall: (_) =>  StoryViewScreen(),

        AppRoutes.call: (_) =>  CallingScreen(),

        AppRoutes.addPet: (_) =>  AddPetScreen(),

        AppRoutes.book: (_) =>  BookingScreen(),

        AppRoutes.bookSuccess: (_) =>  BookingSuccessScreen(),

        AppRoutes.verification: (_) =>  VerificationScreen(),

        AppRoutes.verifyYourself: (_) =>  VerifyYourselfScreen(),

        AppRoutes.clinicDocs: (_) =>  UploadClinicDocScreen(),

        AppRoutes.vetLicense: (_) =>  UploadVetDocumentScreen(),

        AppRoutes.other1: (_) =>  OtherDetails1(),

        AppRoutes.other2: (_) =>  OtherDetails2(),

        AppRoutes.other3: (_) =>  OtherDetails3(),

        AppRoutes.registrationSuccess: (_) =>  RegistrationSuccessScreen(),

        AppRoutes.docDashboard: (_) => DoctorDashboardScreen(),

        AppRoutes.appointments: (_) => AppointmentScreen(),

        AppRoutes.growth: (_) => GrowthScreen(),

        AppRoutes.wallet: (_) => WalletScreen(),

        AppRoutes.profile: (_) => ProfileScreen(),

        AppRoutes.editProfile: (_) => EditProfileScreen(isDoctor: true),

        AppRoutes.profileAppointment: (_) => ProfileAppointmentScreen(),

        AppRoutes.profilePayment: (_) => PaymentScreen(),

        AppRoutes.profileConsultation: (_) => ConsultationScreen(),

        AppRoutes.profileRescue: (_) => MyRescueScreen(),

        AppRoutes.profileSettings: (_) => SettingsScreen(),

        AppRoutes.activity: (_) => DailyActivityScreen(),

        AppRoutes.dietPlan: (_) => DietPlanScreen(),

        AppRoutes.waterIntake: (_) => WaterIntakeScreen(),

        AppRoutes.symptomChecker: (_) => SymptomCheckerScreen(),

        AppRoutes.behavior: (_) => BehaviorInsightScreen(),

        AppRoutes.petRecord: (_) => PetRecordScreen(),

        AppRoutes.caretaker: (_) => CaretakerScreen(),

        AppRoutes.viewDetails: (_) => RequestDetailScreen(),

        AppRoutes.myRequests: (_) => MyRequestScreen(),

        AppRoutes.findCaretaker: (_) => FindCaretakerScreen(),




      },

    );
  }
}