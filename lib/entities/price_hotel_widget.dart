import 'package:effective_mobile_test_tasck/shared/text__sf_pro_30__widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HotelPriceWidget extends StatelessWidget {
  final int minimalPrice;
  HotelPriceWidget({required this.minimalPrice});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text_SFPro_30_Widget(
          title:
              'от ${NumberFormat('#,##0', 'en_US').format(minimalPrice).replaceAll(',', ' ')} ₽',
          color: Colors.black,
        )
      ],
    );
  }
}
