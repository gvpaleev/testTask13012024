import 'package:effective_mobile_test_tasck/entities/hotel_address_widget.dart';
import 'package:effective_mobile_test_tasck/entities/hotel_rating_widget.dart';
import 'package:effective_mobile_test_tasck/entities/name_hotel_widget.dart';
import 'package:flutter/material.dart';

class BasicDataHotel extends StatelessWidget {
  final String name;
  final String address;
  final String rating;
  const BasicDataHotel(
      {super.key,
      required this.name,
      required this.address,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HotelRatingWidget(
          rating: this.rating,
        ),
        const SizedBox(height: 8),
        HotelNameWidget(
          name: this.name,
        ),
        const SizedBox(height: 8),
        HotelAddressWidget(address: address),
      ],
    );
  }
}
