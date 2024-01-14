import 'package:effective_mobile_test_tasck/shared/text__sf_pro_16__widget.dart';
import 'package:flutter/material.dart';

class InfoPriceDataWidget extends StatelessWidget {
  final String priceForIt;
  InfoPriceDataWidget({required this.priceForIt});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text_SFPro_16_Widget(title: priceForIt, color: Color(0xFF828796))
      ],
    );
  }
}
