import 'package:craftybay/Presentation/UI/Utility/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../State holders/main_navbottom_controlar.dart';
import '../widgets/cart_product_card.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (dib) async {
      Get.find<MainNavBottomController>().changeScreen(0);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Carts'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return const cartproductcard();
                      }),
                )
              ]),
            ),
            Container(
              decoration: BoxDecoration(
                  color: colorPaletter.primaryColor.withOpacity(0.1)),
              child: Row(
                children: [
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Column(
                      children: [
                        Text('Price',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18)),
                        Text('\$2000',
                            style: TextStyle(
                                color: colorPaletter.primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 18))
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          'Checkout',
                          style: TextStyle(color: Colors.white, letterSpacing: 1),
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
