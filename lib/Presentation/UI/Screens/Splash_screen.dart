import 'package:craftybay/Presentation/UI/Screens/auth/auth_controller.dart';
import 'package:craftybay/Presentation/UI/Utility/assets_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'Navigator_bar.dart';
import 'auth/email_verifiation.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({super.key});

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    goToNext();
  }

  Future<void> goToNext() async {
    await AuthController.getAccessToken();

    Future.delayed(const Duration(seconds: 3)).then((value) {
      print(AuthController.getAccessToken());
      Get.offAll(AuthController.isLoggedIn
          ? const NavigationBarButton()
          : const EmailVerification());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
              child: SvgPicture.asset(
            Imageasset.craftylogoSVG,
            width: 100,
          )),
          const Spacer(),
          const CircularProgressIndicator(),
          const SizedBox(
            height: 10,
          ),
          const Text("Version : 1.0.0"),
          const SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}
