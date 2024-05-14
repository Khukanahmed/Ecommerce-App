import 'package:craftybay/Presentation/State%20holders/otp_verification_controller.dart';
import 'package:craftybay/Presentation/UI/Utility/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../Utility/assets_image.dart';
import '../Navigator_bar.dart';

class OtpVerification extends StatefulWidget {
  final String email;

  const OtpVerification({super.key, required this.email});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  TextEditingController _Otpcontroller = TextEditingController();
  OtpVerifyController controller = Get.put(OtpVerifyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 100),
          child: Column(
            children: [
              Center(
                  child: SvgPicture.asset(
                Imageasset.craftylogoSVG,
                width: 100,
              )),
              const SizedBox(height: 10),
              Text(
                'Enter OTP Code',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text('A 4 digit OTP Code Sent',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.grey)),
              const SizedBox(height: 10),
              PinCodeTextField(
                controller: _Otpcontroller,
                length: 4,
                obscureText: false,
                animationType: AnimationType.fade,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  selectedFillColor: Colors.white,
                  activeColor: colorPaletter.primaryColor,
                  inactiveColor: colorPaletter.primaryColor,
                  selectedColor: Colors.green,
                ),
                animationDuration: const Duration(milliseconds: 300),
                //backgroundColor: Colors.blue.shade50,
                enableActiveFill: true,

                onCompleted: (v) {
                  print("Completed");
                },
                // onChanged: (value) {
                //   print(value);
                //   setState(() {});
                // },
                // beforeTextPaste: (text) {
                //   print("Allowing to paste $text");
                //   //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                //   //but you can show anything you want here, like your pop up saying wrong paste format or etc
                //   return true;
                // },
                appContext: context,
              ),
              const SizedBox(height: 20),
              SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: GetBuilder<OtpVerifyController>(
                    builder: (otpcontroller) {
                      if (otpcontroller.otpverifyInprograss) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return ElevatedButton(
                          onPressed: () async {
                            final respons = await controller.OtpVerify(
                                widget.email, _Otpcontroller.text);

                            if (respons) {
                              Get.offAll(const NavigationBarButton());
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Otp verfication fail')));
                            }
                          },
                          child: const Text(
                            'Next',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                letterSpacing: 0.5),
                          ));
                    },
                  )),
              const SizedBox(
                height: 25,
              ),
              RichText(
                  text: const TextSpan(
                      style: TextStyle(color: Colors.grey),
                      children: [
                    TextSpan(text: 'This code will expired in '),
                    TextSpan(
                        text: '120 s',
                        style: TextStyle(color: colorPaletter.primaryColor))
                  ])),
              TextButton(
                onPressed: () {},
                child: const Text('Resent Code',
                    style: TextStyle(color: Colors.grey)),
              )
            ],
          ),
        ),
      )),
    );
  }
}
