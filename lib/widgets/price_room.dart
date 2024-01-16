import 'package:effective_mobile_test_tasck/entities/info_price_data_widget.dart';

import 'package:effective_mobile_test_tasck/entities/price_room_widget.dart';
import 'package:flutter/material.dart';

class RoomPrice extends StatelessWidget {
  final int minimalPrice;
  final String priceForIt;
  const RoomPrice(
      {super.key, required this.minimalPrice, required this.priceForIt});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          RoomPriceWidget(minimalPrice: this.minimalPrice),
          const SizedBox(width: 8),
          Column(
            children: [
              const SizedBox(
                height: 14,
              ),
              InfoPriceDataWidget(priceForIt: this.priceForIt),
            ],
          ),
        ],
      ),
    );
  }
}
