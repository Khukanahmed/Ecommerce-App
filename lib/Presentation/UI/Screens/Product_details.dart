import 'package:craftybay/Presentation/UI/Utility/color_palette.dart';
import 'package:craftybay/Presentation/UI/widgets/Home/product_silder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/customstapper.dart';
import 'review_screen.dart';

class Product_details extends StatefulWidget {
  const Product_details({super.key});

  @override
  State<Product_details> createState() => _Product_detailsState();
}

class _Product_detailsState extends State<Product_details> {
  List<Color> colors = [
    Colors.amber,
    Colors.blue,
    Colors.green,
    Colors.pink,
    Colors.deepOrange
  ];
  int select_index = 0;
  int select_size = 0;

  List<String> sizes = ['S', 'M', 'L', 'XL', 'XXL'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            SizedBox(height: 320, child: Product_Slider()),
            AppBar(
              title: const Text('Product Details'),
              backgroundColor: Colors.transparent,
            )
          ]),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                            child: Text('Happy The spcal deal- New product',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600))),
                        customstapper(
                          lowerlimit: 0,
                          onchange: (new_value) {
                            print(new_value);
                          },
                          stepvalue: 1,
                          upperlimit: 10,
                          value: 1,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 22,
                          color: Colors.amber,
                        ),
                        const Text(
                          '4.5',
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 16,
                          ),
                        ),
                        TextButton(
                          child: const Text(
                            'Review',
                            style: TextStyle(
                                color: colorPaletter.primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          onPressed: () {
                            Get.to(Review_screen());
                          },
                        ),
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
                              size: 20,
                            ),
                          ),
                        )
                      ],
                    ),
                    const Text(
                      'Colors',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    SizedBox(height: 5),
                    SizedBox(
                      height: 35,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: colors.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: () {
                                select_index = index;
                                if (mounted) {
                                  setState(() {});
                                }
                              },
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: colors[index],
                                child: select_index == index
                                    ? const Icon(
                                        Icons.done,
                                        color: Colors.white,
                                      )
                                    : null,
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Size',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    SizedBox(height: 5),
                    SizedBox(
                      height: 35,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: sizes.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                              borderRadius: BorderRadius.circular(16),
                              onTap: () {
                                select_size = index;
                                if (mounted) {
                                  setState(() {});
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: select_size == index
                                        ? colorPaletter.primaryColor
                                        : null,
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(2)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(sizes[index]),
                                ),
                              ));
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(width: 8);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text('Description',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18)),
                    SizedBox(height: 8),
                    Text(
                      'Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity. Description is one of four rhetorical modes (also known as modes of discourse), along with exposition, argumentation, and narration. Fiction-writing specifically has modes Description is the fiction-writing mode for transmitting a mental image of the particulars of a story. Together with dialogue, narration, exposition, and summarization, description is one of the most widely recognized of the fiction-writing modes. As stated in Writing from A to Z, edited by Kirk Polking, description is more than the amassing of details; it is bringing something to life by carefully ',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: colorPaletter.primaryColor.withOpacity(0.1)),
            child: Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Add To Card',
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
