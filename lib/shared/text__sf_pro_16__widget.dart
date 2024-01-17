import 'package:flutter/material.dart';

class Text_SFPro_16_Widget extends StatelessWidget {
  final String title;
  final Color color;
  final FontWeight fontWeigh;

  Text_SFPro_16_Widget(
      {required this.title,
      this.color = Colors.black,
      this.fontWeigh = FontWeight.w500});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color,
        fontSize: 16,
        fontFamily: 'SF Pro Display',
        fontWeight: fontWeigh,
      ),
    );
  }
}
