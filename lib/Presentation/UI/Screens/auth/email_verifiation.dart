import 'package:craftybay/Presentation/State%20holders/email_varification_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Utility/assets_image.dart';
import 'otp_verifiaction.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({super.key});

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  TextEditingController _emailtext = TextEditingController();
  GlobalKey<FormState> _emailkey = GlobalKey<FormState>();
  final evController = Get.put(EmailVerificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 100),
        child: Form(
          key: _emailkey,
          child: Column(
            children: [
              Center(
                  child: SvgPicture.asset(
                Imageasset.craftylogoSVG,
                width: 100,
              )),
              const SizedBox(height: 10),

              // khukannub99@gmail.com
              Text(
                'Welcome back',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text('Please Enter Your Email Address',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.grey)),
              const SizedBox(height: 10),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _emailtext,
                decoration: const InputDecoration(hintText: 'Email Address'),
                validator: (String? text) {
                  if (text?.isEmpty ?? true) {
                    return 'Enter your email address';
                  } else if (text!.isEmail == false) {
                    return 'Enter a valid Email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: GetBuilder<EmailVerificationController>(
                      builder: (controller) {
                    if (controller.emailVerificationInprogress) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return ElevatedButton(
                        onPressed: () async {
                          if (_emailkey.currentState!.validate()) {
                            final respons =
                                await evController.verfiyEmail(_emailtext.text);
                            if (respons) {
                              Get.to(() => OtpVerification(
                                    email: _emailtext.text,
                                  ));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('verfication email')));
                            }
                          }
                        },
                        child: const Text(
                          'Next',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              letterSpacing: 0.5),
                        ));
                  }))
            ],
          ),
        ),
      )),
    );
  }
}
