import 'package:craftybay/Presentation/UI/Utility/color_palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'customstapper.dart';

class cartproductcard extends StatelessWidget {
  const cartproductcard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    image: NetworkImage(
                        'https://www.pngall.com/wp-content/uploads/13/Nike-Shoes-Air-Max-PNG-Images.png'))),
          ),
          const SizedBox(
            width: 6,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('New Bata show gfgfsdsaf',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600)),
                            RichText(
                                text: const TextSpan(
                                    style: TextStyle(color: Colors.black45),
                                    children: [
                                  TextSpan(text: 'Color:Red  '),
                                  TextSpan(text: 'Size:42')
                                ])),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {
                                var logger = Logger();

                                logger.i("Logger is working!");
                              },
                              icon: const Icon(Icons.delete_rounded)),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '\$1000',
                        style: TextStyle(
                            color: colorPaletter.primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      customstapper(
                        value: 0,
                        upperlimit: 10,
                        stepvalue: 1,
                        onchange: (new_values) {
                          print(new_values);
                        },
                        lowerlimit: 0,
                      )
                    ],
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
