// import 'package:care_paws/modules/home/payment/profile_payment_model.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';
//
// class PaymentController {
//
//   final model = PaymentModel();
//   late Razorpay razorpay;
//
//   void init(){
//     razorpay = Razorpay();
//
//     razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handleSuccess);
//     razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handleError);
//     razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleWallet);
//   }
//
//   void selectMethod(String method){
//     model.selectedMethod = method;
//   }
//
//   void startPayment(){
//
//     var options = {
//       'key': 'YOUR_RAZORPAY_KEY',
//       'amount': (model.total * 100).toInt(),
//       'name': model.doctorName,
//       'description': 'Consultation',
//       'prefill': {
//         'contact': '9999999999',
//         'email': 'test@gmail.com'
//       }
//     };
//
//     razorpay.open(options);
//   }
//
//
//   void handleSuccess(PaymentSuccessResponse response){
//     print("SUCCESS");
//   }
//
//   void handleError(PaymentFailureResponse response){
//     print("FAILED");
//   }
//
//   void handleWallet(ExternalWalletResponse response){}
//
//   void dispose(){
//     razorpay.clear();
//   }
// }