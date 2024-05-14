import 'package:craftybay/Presentation/UI/Utility/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/model/brand_data.dart';
import '../../../../data/model/product_data.dart';
import '../../Screens/Product_details.dart';
import '../../Utility/assets_image.dart';

class ProductCard extends StatelessWidget {
  final productData productpopuler;

  ProductCard({
    super.key,
    required this.productpopuler,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        Get.to(Product_details());
      },
      child: Card(
        child: SizedBox(
          width: 130,
          child: Column(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(productpopuler.image??''),
                  ),
                  color: colorPaletter.primaryColor.withOpacity(0.1),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      productpopuler.title ?? '',
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Colors.blueGrey,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        Text(
                          "\$${productpopuler.price ?? ''}",
                          style: TextStyle(
                              color: colorPaletter.primaryColor,
                              fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.star,
                          size: 20,
                          color: Colors.amber,
                        ),
                        Text(
                          "${productpopuler.star ?? ''}",
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                        const Spacer(),
                        Container(
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              color: colorPaletter.primaryColor),
                          child: const Padding(
                            padding: EdgeInsets.all(4),
                            child: Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
