import 'package:effective_mobile_test_tasck/shared/carousel_with_indicator.dart';
import 'package:effective_mobile_test_tasck/shared/basic_data_hotel.dart';
import 'package:effective_mobile_test_tasck/shared/detailed_data_hotel.dart';
import 'package:effective_mobile_test_tasck/shared/price_hotel.dart';
import 'package:effective_mobile_test_tasck/shared/select_number_button.dart';
import 'package:flutter/material.dart';

class ScreenHotel extends StatelessWidget {
  const ScreenHotel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Отель'))),
      body: ListView(
        children: [
          CarouselSliderHostel(),
          BasicDataHotel(),
          PriceHotel(),
          DetailedDataHotel(),
          SelectNumberButton()
        ],
      ),
    );
  }
}
