import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../State holders/main_navbottom_controlar.dart';
import '../widgets/Category_card.dart';

class Wish_list_prooduct extends StatefulWidget {
  const Wish_list_prooduct({super.key});

  @override
  State<Wish_list_prooduct> createState() => _Wish_list_Screen();
}

class _Wish_list_Screen extends State<Wish_list_prooduct> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        Get.find<MainNavBottomController>().changeScreen(0);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Wishlist'),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios_sharp),
          ),
        ),
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //crossAxisSpacing: 5,
                mainAxisSpacing: 10,
                crossAxisCount: 3),
            itemBuilder: (context, index) {
              // return FittedBox(child: Category_card());
            }),
      ),
    );
  }
}
