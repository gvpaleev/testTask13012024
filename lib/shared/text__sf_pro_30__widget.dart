import 'package:flutter/material.dart';

class Text_SFPro_30_Widget extends StatelessWidget {
  final String title;
  final Color color;
  Text_SFPro_30_Widget({required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color,
        fontSize: 30,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
