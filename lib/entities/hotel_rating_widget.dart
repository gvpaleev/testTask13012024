import 'package:flutter/material.dart';

class HotelRatingWidget extends StatelessWidget {
  final String rating;
  HotelRatingWidget({required this.rating});
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
            rating,
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
