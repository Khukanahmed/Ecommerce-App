import 'package:carousel_slider/carousel_slider.dart';
import 'package:craftybay/Presentation/UI/Utility/color_palette.dart';
import 'package:flutter/material.dart';

class Product_Slider extends StatefulWidget {
  Product_Slider({super.key});

  @override
  State<Product_Slider> createState() => _Product_SliderState();
}

class _Product_SliderState extends State<Product_Slider> {
  final ValueNotifier<int> _selectedSilder = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        CarouselSlider(
          options: CarouselOptions(
              viewportFraction: 1,
              autoPlay: true,
              height: 320.0,
              onPageChanged: (int page, _) {
                _selectedSilder.value = page;
              }),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    //margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(color: Colors.grey.shade400),
                    child: Center(
                      child: Text(
                        'text $i',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ));
              },
            );
          }).toList(),
        ),
        SizedBox(height: 10),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: ValueListenableBuilder(
              valueListenable: _selectedSilder,
              builder: (context, value, _) {
                List<Widget> list = [];
                for (var i = 0; i < 5; i++) {
                  list.add(Container(
                    height: 15,
                    width: 15,
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      // border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                      color: value == i
                          ? colorPaletter.primaryColor
                          : Colors.white,
                    ),
                  ));
                }

                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: list,
                );
              }),
        )
      ]),
    );
  }
}
