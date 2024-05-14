import 'package:carousel_slider/carousel_slider.dart';
import 'package:craftybay/Presentation/UI/Utility/color_palette.dart';
import 'package:flutter/material.dart';

import '../../../../data/model/slider_data.dart';

class HomeSlider extends StatefulWidget {
  final List<SliderData> slider;

  const HomeSlider({super.key, required this.slider});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  final ValueNotifier<int> _selectedSilder = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      CarouselSlider(
        options: CarouselOptions(
            autoPlay: true,
            height: 200.0,
            onPageChanged: (int page, _) {
              _selectedSilder.value = page;
            }),
        items: widget.slider.map((sliderData) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: colorPaletter.primaryColor),
                  child: Stack(children: [
                    Container(
                        alignment: Alignment.bottomRight,
                        child: Image.network(sliderData.image ?? '')),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        sliderData.title ?? '',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600,color: Colors.white),
                      ),
                    ),
                  ]));
            },
          );
        }).toList(),
      ),
      SizedBox(height: 10),
      ValueListenableBuilder(
          valueListenable: _selectedSilder,
          builder: (context, value, _) {
            List<Widget> list = [];
            for (var i = 0; i < widget.slider.length; i++) {
              list.add(Container(
                height: 10,
                width: 10,
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                  color: value == i ? colorPaletter.primaryColor : null,
                ),
              ));
            }

            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: list,
            );
          })
    ]));
  }
}
