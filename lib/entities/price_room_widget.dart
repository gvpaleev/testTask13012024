import 'package:effective_mobile_test_tasck/shared/text__sf_pro_30__widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RoomPriceWidget extends StatelessWidget {
  final int minimalPrice;
  RoomPriceWidget({required this.minimalPrice});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text_SFPro_30_Widget(
          title:
              '${NumberFormat('#,##0', 'en_US').format(minimalPrice).replaceAll(',', ' ')} ₽',
          color: Colors.black,
        )
      ],
    );
  }
}
