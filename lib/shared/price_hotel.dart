import 'package:flutter/material.dart';

class PriceHotel extends StatelessWidget {
  const PriceHotel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text('от 134 673 ₽'),
          Text('за тур с перелётом'),
        ],
      ),
    );
  }
}
