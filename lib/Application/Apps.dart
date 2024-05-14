import 'package:craftybay/Presentation/UI/Screens/Navigator_bar.dart';
import 'package:craftybay/Presentation/UI/Screens/Splash_screen.dart';
import 'package:craftybay/Presentation/UI/Utility/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const NavigationBarButton(),
      theme: ThemeData(
          inputDecorationTheme: const InputDecorationTheme(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Color(0XFF07ADAE),
            )),
            border: OutlineInputBorder(),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(const Color(0XFF07ADAE)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ))),
          ),
          //bottomAppBarColor:Color(0XFF07ADAE) ,
          primaryColor: const Color(0XFF07ADAE),
          primarySwatch: MaterialColor(
              colorPaletter.primaryColor.value, colorPaletter().color)),
    );
  }
}
