import 'package:effective_mobile_test_tasck/shared/hotel_rating.dart';
import 'package:effective_mobile_test_tasck/shared/price_hotel.dart';
import 'package:flutter/material.dart';

class BasicDataHotel extends StatelessWidget {
  const BasicDataHotel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HotelRating(),
        Container(
          child: Text('Steigenberger Makadi'),
        ),
        Container(
          child: Text('Madinat Makadi, Safaga Road, Makadi Bay, Египет'),
        ),
      ],
    );
  }
}
