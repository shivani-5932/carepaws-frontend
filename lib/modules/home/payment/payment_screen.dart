// import 'package:care_paws/modules/home/payment/payment_controller.dart';
// import 'package:care_paws/modules/home/payment/widgets/payment_method_widget.dart';
// import 'package:care_paws/modules/home/payment/widgets/price_details_widget.dart';
// import 'package:care_paws/modules/home/payment/widgets/slot_info_widget.dart';
// import 'package:flutter/material.dart';
//
// class PaymentScreen extends StatefulWidget {
//   const PaymentScreen({super.key});
//
//   @override
//   State<PaymentScreen> createState() => _PaymentScreenState();
// }
//
// class _PaymentScreenState extends State<PaymentScreen> {
//
//   final controller = PaymentController();
//
//   @override
//   void initState() {
//     super.initState();
//     controller.init();
//   }
//
//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     final model = controller.model;
//
//     return Scaffold(
//
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(12),
//
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//
//               /// 🔥 DOC CARD (reuse)
//
//               const SizedBox(height: 10),
//
//               SlotInfoWidget(
//                 dateTime: model.dateTime,
//                 mode: model.mode,
//               ),
//
//               const SizedBox(height: 20),
//
//               const Text("Payments"),
//
//               PaymentMethodWidget(
//                 title: "Credit or Debit card",
//                 icon: "assets/icons/card.png",
//                 onTap: (){
//                   controller.selectMethod("card");
//                   controller.startPayment();
//                 },
//               ),
//
//               PaymentMethodWidget(
//                 title: "Paypal",
//                 icon: "assets/icons/paypal.png",
//                 onTap: (){
//                   controller.selectMethod("paypal");
//                 },
//               ),
//
//               const SizedBox(height: 10),
//
//               const Text(
//                 "Enter a Voucher",
//                 style: TextStyle(color: Colors.orange),
//               ),
//
//               const SizedBox(height: 20),
//
//               PriceDetailsWidget(model: model),
//
//               const SizedBox(height: 20),
//
//               GestureDetector(
//                 onTap: (){
//                   controller.startPayment();
//                 },
//
//                 child: Container(
//                   width: double.infinity,
//                   padding: const EdgeInsets.symmetric(vertical: 14),
//
//                   decoration: BoxDecoration(
//                     color: const Color(0xff6F4E37),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//
//                   child: const Center(
//                     child: Text(
//                       "Pay Now",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }