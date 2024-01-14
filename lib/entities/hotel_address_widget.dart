import 'package:effective_mobile_test_tasck/shared/text__sf_pro_14__widget.dart';
import 'package:flutter/material.dart';

class HotelAddressWidget extends StatelessWidget {
  final String address;
  HotelAddressWidget({required this.address});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text_SFPro_14_Widget(title: address, color: Color(0xFF0D72FF)));
  }
}
