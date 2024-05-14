import 'package:craftybay/Presentation/UI/Utility/color_palette.dart';
import 'package:flutter/material.dart';

class customstapper extends StatefulWidget {
  customstapper(
      {super.key,
      required this.lowerlimit,
      required this.upperlimit,
      required this.stepvalue,
      required this.value,
      required this.onchange});

  final int lowerlimit;
  final int upperlimit;
  int value;
  final int stepvalue;

  final Function(int) onchange;

  @override
  State<customstapper> createState() => _customstapperState();
}

class _customstapperState extends State<customstapper> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Container(
        child: Row(
          children: [
            InkWell(
              child: Container(
                  decoration: BoxDecoration(
                      color: colorPaletter.primaryColor,
                      borderRadius: BorderRadius.circular(3)),
                  child: const Icon(Icons.remove, color: Colors.white)),
              onTap: () {
                widget.value = widget.value == widget.lowerlimit
                    ? widget.lowerlimit
                    : widget.value -= widget.stepvalue;
                widget.onchange(widget.value);
                setState(() {});
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('${widget.value}'),
            ),
            InkWell(
              child: Container(
                  decoration: BoxDecoration(
                      color: colorPaletter.primaryColor,
                      borderRadius: BorderRadius.circular(3)),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  )),
              onTap: () {
                widget.value = widget.value == widget.upperlimit
                    ? widget.upperlimit
                    : widget.value += widget.stepvalue;
                widget.onchange(widget.value);
                setState(() {});
              },
            )
          ],
        ),
      ),
    );
  }
}
