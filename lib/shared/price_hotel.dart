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
          PriceHotelWidget(),
          SizedBox(width: 8),
          Column(
            children: [
              SizedBox(
                height: 14,
              ),
              InfoPriceDataWidget(),
            ],
          ),
        ],
      ),
    );
  }
}

class PriceHotelWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'от 134 673 ₽',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class InfoPriceDataWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'за тур с перелётом',
          style: TextStyle(
            color: Color(0xFF828796),
            fontSize: 16,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
