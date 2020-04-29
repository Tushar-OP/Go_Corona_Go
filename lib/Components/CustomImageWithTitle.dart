import 'package:flutter/material.dart';

class CustomImageWithTitle extends StatelessWidget {
  CustomImageWithTitle({@required this.imagePath, @required this.titleText});

  final String imagePath;
  final String titleText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(
          imagePath,
          width: 100,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          titleText,
          style: TextStyle(fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
