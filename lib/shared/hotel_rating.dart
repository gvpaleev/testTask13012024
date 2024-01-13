import 'package:flutter/material.dart';

class HotelRating extends StatelessWidget {
  const HotelRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 129,
      height: 19,
      color: Color.fromRGBO(255, 199, 0, 0.20),
      child: Row(
        children: [
          Icon(
            Icons.star,
            color: const Color.fromRGBO(255, 168, 0, 1),
            size: 15.0,
          ),
          Text(
            '5 Превосходно',
            style: TextStyle(color: Color.fromRGBO(255, 168, 0, 1)),
          )
        ],
      ),
    );
  }
}
