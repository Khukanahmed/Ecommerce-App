import 'package:craftybay/Presentation/UI/Utility/color_palette.dart';
import 'package:flutter/material.dart';

class SelectHeader extends StatelessWidget {
  final String title;
  final VoidCallback Ontap;

  const SelectHeader({
    super.key,
    required this.title,
    required this.Ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        const Spacer(),
        TextButton(
            onPressed: Ontap,
            child: Text('See All',
                style: TextStyle(color: colorPaletter.primaryColor)))
      ],
    );
  }
}
