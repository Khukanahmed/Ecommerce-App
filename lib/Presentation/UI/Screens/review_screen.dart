import 'package:craftybay/Presentation/UI/Screens/create_review.dart';
import 'package:craftybay/Presentation/UI/Utility/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../widgets/review_card.dart';

class Review_screen extends StatefulWidget {
  const Review_screen({super.key});

  @override
  State<Review_screen> createState() => _Review_screenState();
}

class _Review_screenState extends State<Review_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reveiw'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    review_card(
                      username: 'Khukan Ahmed 1',
                    ),
                    review_card(
                      username: 'Khukan Ahmed 2',
                    ),
                    review_card(
                      username: 'Khukan Ahmed 3',
                    ),
                    review_card(
                      username: 'Khukan Ahmed 4',
                    ),
                    review_card(
                      username: 'Khukan Ahmed 5',
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 80,
            decoration: BoxDecoration(
                color: colorPaletter.primaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Reviews (1000)",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      Get.to(CreateReviewScreen());
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: colorPaletter.primaryColor),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
