import 'package:flutter/material.dart';

class DetailedDataHotel extends StatelessWidget {
  const DetailedDataHotel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(
          child: Text('Об отеле'),
        ),
        Container(
            child: Row(
                children: [Text('3-я линия'), Text("Платный Wi-Fi в фойе")])),
        Container(
            child: Row(
                children: [Text('30 км до аэропорта'), Text("1 км до пляжа")])),
        Container(
          child: Text(
              'Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!'),
        ),
        Container(
          child: Column(children: [
            Container(
              child: Row(
                children: [
                  Icon(Icons.star),
                  Column(
                    children: [Text('Удобства'), Text('Самое необходимое')],
                  ),
                  Icon(Icons.check)
                ],
              ),
            )
          ]),
        ),
        Container(
          child: Column(children: [
            Container(
              child: Row(
                children: [
                  Icon(Icons.star),
                  Column(
                    children: [Text('Удобства'), Text('Самое необходимое')],
                  ),
                  Icon(Icons.check)
                ],
              ),
            )
          ]),
        ),
        Container(
          child: Column(children: [
            Container(
              child: Row(
                children: [
                  Icon(Icons.star),
                  Column(
                    children: [Text('Удобства'), Text('Самое необходимое')],
                  ),
                  Icon(Icons.check)
                ],
              ),
            )
          ]),
        ),
      ]),
    );
  }
}
