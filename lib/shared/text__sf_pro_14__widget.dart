import 'package:flutter/material.dart';

class Text_SFPro_14_Widget extends StatelessWidget {
  final String title;
  final Color color;
  final FontWeight fontWeigh;

  Text_SFPro_14_Widget(
      {required this.title,
      required this.color,
      this.fontWeigh = FontWeight.w500});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color,
        fontSize: 14,
        fontFamily: 'SF Pro Display',
        fontWeight: fontWeigh,
      ),
    );
  }
}
