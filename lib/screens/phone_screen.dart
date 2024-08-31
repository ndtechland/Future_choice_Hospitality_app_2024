import 'package:fch_club_new24/utils/datasource.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import 'otp_screen.dart';

class PhoneScreen extends StatelessWidget {
  final OtpController controller = Get.put(OtpController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Authentication'),
      //   backgroundColor: primaryColor,
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('images/logoheader.jpeg'),

              // Mobile Number Input
              Container(
                padding: EdgeInsets.only(left: 16.0, top: 16, right: 16),
                margin: EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  controller: controller.mobileController,
                  decoration: InputDecoration(
                    labelText: 'Mobile Number',
                    prefixIcon: Icon(Icons.phone, color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                ),
              ),

              //SizedBox(height: 20),

              // Send OTP Button
              Obx(() {
                if (controller.isSendingOtp.value) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(left: 100.0, right: 100.0),
                    child: Container(
                      height: 50,
                      width: 120,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () async {
                          final mobileNumber = controller.mobileController.text;
                          if (mobileNumber.isNotEmpty) {
                            await controller.sendOtp(mobileNumber);
                            await Future.delayed(Duration(seconds: 1));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OtpVerifyScreen()));
                          } else {
                            Get.snackbar(
                                'Error', 'Please enter a mobile number');
                          }
                        },
                        child: Text(
                          'Send OTP',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  );
                }
              }),

              SizedBox(height: 20),
              // Padding(
              //   padding: const EdgeInsets.only(left: 100.0,right: 100.0),
              //   child: SizedBox(
              //     width: width / 2,
              //     child: PinFieldAutoFill(
              //       textInputAction: TextInputAction.none,
              //       keyboardType: TextInputType.number,
              //       cursor:
              //       Cursor(color: Colors.orange, enabled: true, width: 2),
              //       autoFocus: true,
              //       controller: controller.otpController,
              //       codeLength: 4,
              //       currentCode: controller.otpController.text,
              //       decoration: UnderlineDecoration(
              //         textStyle: TextStyle(color: primaryColor),
              //         colorBuilder: FixedColorBuilder(primaryColor),
              //       ),
              //       onCodeChanged: (pin) {
              //         if (pin!.length == 4) {
              //           FocusScope.of(context).unfocus();
              //          // signInWithPhoneNumber(pin);
              //         }
              //       },
              //     ),
              //   ),
              // ),
              // // OTP Input
              // // Container(
              // //   padding: EdgeInsets.only(left: 16.0,top: 16,right: 16),
              // //   margin: EdgeInsets.symmetric(vertical: 10),
              // //   child: TextField(
              // //     controller: otpController,
              // //     decoration: InputDecoration(
              // //       labelText: 'Enter OTP',
              // //       prefixIcon: Icon(Icons.lock, color: Colors.blueAccent),
              // //       border: OutlineInputBorder(
              // //         borderRadius: BorderRadius.circular(12),
              // //       ),
              // //     ),
              // //     keyboardType: TextInputType.number,
              // //   ),
              // // ),
              //
              // SizedBox(height: 20),
              //
              // // Verify OTP Button
              // Obx(() {
              //   if (controller.isVerifyingOtp.value) {
              //     return Center(child: CircularProgressIndicator());
              //   } else {
              //     return Padding(
              //       padding: const EdgeInsets.only(left: 100.0,right: 100.0),
              //       child: ElevatedButton(
              //         style: ElevatedButton.styleFrom(
              //           backgroundColor: Colors.green,
              //           padding: EdgeInsets.symmetric(vertical: 15),
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(12),
              //           ),
              //         ),
              //         onPressed: () async {
              //           final otp = controller.otpController.text;
              //           final mobileNumber = controller.mobileController.text;
              //           if (otp.isNotEmpty) {
              //             await controller.verifyOtp(mobileNumber, otp);
              //             if (controller.otpMessage.value.contains('Success')) {
              //               Navigator.pushNamedAndRemoveUntil(
              //                   context, '/home_screen', (route) => false);
              //             } else {
              //               Get.snackbar('Error', controller.otpMessage.value);
              //             }
              //           } else {
              //             Get.snackbar('Error', 'Please enter OTP');
              //           }
              //         },
              //         child: Text(
              //           'Verify OTP',
              //           style: TextStyle(fontSize: 16,color: Colors.white),
              //         ),
              //       ),
              //     );
              //   }
              // }),
              //
              // SizedBox(height: 20),

              // OTP Message
              Obx(() {
                return Text(
                  controller.numMessage.value,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: controller.numMessage.value.contains('Error')
                        ? Colors.red
                        : Colors.green,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sms_autofill/sms_autofill.dart';
// import '../controllers/login_controller.dart';
// import '../controllers/otp_controller.dart';
//
// class PhoneScreen extends StatelessWidget {
//   final OtpController controller = Get.put(OtpController());
//   final TextEditingController mobileController = TextEditingController();
//   final TextEditingController otpController = TextEditingController();
//   final FocusNode _pinFocusNode = FocusNode();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('OTP Authentication'),
//         backgroundColor: Colors.blueAccent,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               // Mobile Number Input
//               Container(
//                 margin: EdgeInsets.symmetric(vertical: 10),
//                 child: TextField(
//                   controller: mobileController,
//                   decoration: InputDecoration(
//                     labelText: 'Mobile Number',
//                     prefixIcon: Icon(Icons.phone, color: Colors.blueAccent),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   keyboardType: TextInputType.phone,
//                 ),
//               ),
//
//               SizedBox(height: 20),
//
//               // Send OTP Button
//               Obx(() {
//                 if (controller.isSendingOtp.value) {
//                   return Center(child: CircularProgressIndicator());
//                 } else {
//                   return ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blueAccent,
//                       padding: EdgeInsets.symmetric(vertical: 15),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     onPressed: () {
//                       final mobileNumber = mobileController.text;
//                       if (mobileNumber.isNotEmpty) {
//                         controller.sendOtp(mobileNumber);
//                       } else {
//                         Get.snackbar('Error', 'Please enter a mobile number');
//                       }
//                     },
//                     child: Text(
//                       'Send OTP',
//                       style: TextStyle(fontSize: 16),
//                     ),
//                   );
//                 }
//               }),
//
//               SizedBox(height: 20),
//
//               // OTP Input using PinFieldAutoFill
//               PinFieldAutoFill(
//                 controller: otpController,
//                 focusNode: _pinFocusNode,
//                 decoration: BoxLooseDecoration(
//                   strokeColorBuilder: FixedColorBuilder(Colors.blueAccent),
//                   gapSpace: 15.0,
//                   textStyle: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                  // hintText: '0', // Single character hint text
//                 ),
//                 keyboardType: TextInputType.number,
//                 codeLength: 4, // Set to 4 digits
//                 onCodeChanged: (code) {
//                   // Optional: handle code changes
//                 },
//               ),
//
//               SizedBox(height: 20),
//
//               // Verify OTP Button
//               Obx(() {
//                 if (controller.isVerifyingOtp.value) {
//                   return Center(child: CircularProgressIndicator());
//                 } else {
//                   return ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.green,
//                       padding: EdgeInsets.symmetric(vertical: 15),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     onPressed: () async {
//                       final otp = otpController.text;
//                       final mobileNumber = mobileController.text;
//                       if (otp.isNotEmpty) {
//                         await controller.verifyOtp(mobileNumber, otp);
//                         if (controller.otpMessage.value.contains('Success')) {
//                           Navigator.pushNamedAndRemoveUntil(
//                               context, '/home_screen', (route) => false);
//                         } else {
//                           Get.snackbar('Error', controller.otpMessage.value);
//                         }
//                       } else {
//                         Get.snackbar('Error', 'Please enter OTP');
//                       }
//                     },
//                     child: Text(
//                       'Verify OTP',
//                       style: TextStyle(fontSize: 16),
//                     ),
//                   );
//                 }
//               }),
//
//               SizedBox(height: 20),
//
//               // OTP Message
//               Obx(() {
//                 return Text(
//                   controller.otpMessage.value,
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: controller.otpMessage.value.contains('Error')
//                         ? Colors.red
//                         : Colors.green,
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 );
//               }),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
