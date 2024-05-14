import 'package:flutter/material.dart';

class Circulericonbutton extends StatelessWidget {
  const Circulericonbutton({
    super.key,
    required this.data,
    required this.tap,
  });

  final IconData data;
  final VoidCallback tap;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey.shade200,
      radius: 15,
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: tap,
        icon: Icon(
          data,
          color: Colors.grey,
          size: 20,
        ),
      ),
    );
  }
}
