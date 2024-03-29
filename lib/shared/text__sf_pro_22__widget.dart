import 'package:flutter/material.dart';

class Text_SFPro_22_Widget extends StatelessWidget {
  final String title;
  final Color color;
  Text_SFPro_22_Widget({required this.title, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color,
        fontSize: 22,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
