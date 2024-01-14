import 'package:effective_mobile_test_tasck/shared/hotel_rating.dart';
import 'package:effective_mobile_test_tasck/shared/price_hotel.dart';
import 'package:flutter/material.dart';

class BasicDataHotel extends StatelessWidget {
  const BasicDataHotel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HotelRatingWidget(),
        SizedBox(height: 8),
        NameHotelWidget(),
        SizedBox(height: 8),
        AddresHotelWidget(),
      ],
    );
  }
}

class HotelRatingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 29,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: ShapeDecoration(
        color: Color(0x33FFC600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              child: Icon(Icons.star, color: Color(0xFFFFA800), size: 19)),
          const SizedBox(width: 2),
          Text(
            '5 Превосходно',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFFFA800),
              fontSize: 16,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w500,
              height: 0.07,
            ),
          ),
        ],
      ),
    );
  }
}

class NameHotelWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Steigenberger Makadi',
        style: TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class AddresHotelWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Madinat Makadi, Safaga Road, Makadi Bay, Египет',
        style: TextStyle(
          color: Color(0xFF0D72FF),
          fontSize: 14,
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w500,
          height: 0.09,
        ),
      ),
    );
  }
}
