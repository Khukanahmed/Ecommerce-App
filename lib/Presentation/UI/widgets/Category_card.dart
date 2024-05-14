import 'package:craftybay/Presentation/State%20holders/category_controller.dart';
import 'package:craftybay/Presentation/UI/Utility/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/category_data.dart';

class Category_card extends StatelessWidget {
  final CategoryData categoryData;

  Category_card({
    super.key,
    required this.categoryData,
  });

  CategoryController controller = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
           // height: 60,
            margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: colorPaletter.primaryColor.withOpacity(0.1)),
            child: Image.network(categoryData.categoryImg ?? '',height: 35,)),
        SizedBox(
          height: 8,
        ),
        Text(
          categoryData.categoryName ?? '',
          style: TextStyle(
              fontSize: 15,
              color: colorPaletter.primaryColor,
              letterSpacing: 0.4),
        )
      ],
    );
  }
}
