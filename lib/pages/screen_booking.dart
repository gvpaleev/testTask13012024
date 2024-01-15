import 'package:flutter/material.dart';

class ScreenBooking extends StatelessWidget {
  const ScreenBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Бронирование'))),
      body: BodyBooking(),
    );
  }
}

class BodyBooking extends StatelessWidget {
  const BodyBooking({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            // children: [BasicDataHotel(), InfoBooking(), InfoBuyer()],
            ));
  }
}

class InfoBuyer extends StatelessWidget {
  const InfoBuyer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Text('Информация о покупателе'),
        Column(
          children: [Text('Номер телефона'), Text('+7 (951) 555-99-00')],
        ),
        Column(
          children: [Text('Номер телефона'), Text('+7 (951) 555-99-00')],
        ),
        Text(
            'Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту')
      ]),
    );
  }
}

class InfoBooking extends StatelessWidget {
  const InfoBooking({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text('Вылет из'),
              Text('Санкт-Петербург'),
            ],
          ),
        ],
      ),
    );
  }
}
