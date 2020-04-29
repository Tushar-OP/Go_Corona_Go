import 'package:flutter/material.dart';

class CustomSymptomCard extends StatelessWidget {
  CustomSymptomCard(
      {@required this.imagePath, @required this.title, @required this.note});

  final String imagePath;
  final String title;
  final String note;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 30),
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Card(
            color: Colors.white,
            elevation: 5.0,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 120,
            ),
          ),
          Positioned(
            left: 0,
            bottom: 20,
            child: Image.asset(
              imagePath,
              width: 100,
            ),
          ),
          Positioned(
            top: 20,
            left: 130,
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 19,
              ),
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width - 40 - 160,
            top: 50,
            left: 130,
            child: Text(
              note,
              style: TextStyle(
                fontSize: 13,
              ),
            ),
          )
        ],
      ),
    );
  }
}
