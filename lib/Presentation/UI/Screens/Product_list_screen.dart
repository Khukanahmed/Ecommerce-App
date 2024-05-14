import 'package:craftybay/Presentation/State%20holders/main_navbottom_controlar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../State holders/category_controller.dart';
import '../widgets/Category_card.dart';

class Categorise_list_prooduct extends StatefulWidget {
  const Categorise_list_prooduct({super.key});

  @override
  State<Categorise_list_prooduct> createState() => _Categorise_list_Screen();
}

class _Categorise_list_Screen extends State<Categorise_list_prooduct> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<MainNavBottomController>().changeScreen(0);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Categorises'),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.find<MainNavBottomController>().changeScreen(0);
            },
            icon: Icon(Icons.arrow_back_ios_sharp),
          ),
        ),
        body: GetBuilder<CategoryController>(builder: (categoryController) {
          return GridView.builder(
              itemCount: categoryController.categorymodel.data?.length ?? 0,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

                  //crossAxisSpacing: 5,
                  mainAxisSpacing: 10,
                  crossAxisCount: 4),
              itemBuilder: (context, index) {
                return FittedBox(
                    child: Category_card(
                  categoryData: categoryController.categorymodel.data![index],
                ));
              });
        }),
      ),
    );
  }
}
