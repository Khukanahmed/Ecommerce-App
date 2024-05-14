import 'package:flutter/material.dart';

class review_card extends StatefulWidget {
   review_card({
    super.key,
   required this.username
  });
final String username;
  @override
  State<review_card> createState() => _review_cardState();
}

class _review_cardState extends State<review_card> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: const Offset(
                2.0,
                2.0,
              ),
              blurRadius: 5.0,
              spreadRadius: .1,
            ), //BoxShadow
            BoxShadow(
              color: Colors.white,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
          borderRadius: BorderRadius.circular(5),
          //border: Border.all(color: Colors.grey,)
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    child: Icon(Icons.psychology_rounded),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    widget.username,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  )
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                  'A review is an evaluation of a publication, product, service, or company or a critical take on current affairs in literature, politics or culture. In addition to a critical evaluation, ')
            ],
          ),
        ),
      ),
    );
  }
}