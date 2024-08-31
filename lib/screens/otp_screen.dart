import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../controllers/login_controller.dart';

class OtpVerifyScreen extends StatefulWidget {
  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  final OtpController controller = Get.put(OtpController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Image.asset('images/logoheader.jpeg'),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Enter OTP",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: SizedBox(
                    width: width / 2,
                    child: Pinput(
                      length: 4,
                      controller: controller.otpController,
                      keyboardType: TextInputType.number,
                      autofocus: true,
                      showCursor: true,
                      onChanged: (pin) {
                        if (pin.length == 4) {
                          FocusScope.of(context).unfocus();
                        }
                      },
                      defaultPinTheme: PinTheme(
                        width: 60,
                        height: 60,
                        textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Obx(() {
                  if (controller.isVerifyingOtp.value) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return Container(
                      height: 50,
                      width: 120,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                          // Replace with your primary color
                          padding: EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () async {
                          final otp = controller.otpController.text;
                          final mobileNumber = controller.mobileController.text;
                          if (otp.isNotEmpty) {
                            await controller.verifyOtp(mobileNumber, otp);
                            if (controller.otpMessage.value
                                .contains('Success')) {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/home_screen', (route) => false);
                            } else {
                              Get.snackbar(
                                  'Error', controller.otpMessage.value);
                            }
                          } else {
                            Get.snackbar('Error', 'Please enter OTP');
                          }
                        },
                        child: Text(
                          'Verify OTP',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    );
                  }
                }),
                SizedBox(height: 20),
                Obx(() {
                  return Text(
                    controller.otpMessage.value,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: controller.otpMessage.value.contains('Error')
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
      ),
    );
  }
}
