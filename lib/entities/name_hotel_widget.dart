import 'package:effective_mobile_test_tasck/shared/text__sf_pro_16__widget.dart';
import 'package:effective_mobile_test_tasck/shared/text__sf_pro_22__widget.dart';
import 'package:flutter/material.dart';

class HotelNameWidget extends StatelessWidget {
  final String name;
  HotelNameWidget({required this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text_SFPro_22_Widget(title: this.name, color: Colors.black));
  }
}
