import 'package:effective_mobile_test_tasck/shared/select_number_button.dart';
import 'package:flutter/material.dart';

class BodyNumber extends StatelessWidget {
  const BodyNumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        // CarouselSliderImg(),
        BasicDataNumber(),
      ],
    ));
  }
}

class BasicDataNumber extends StatelessWidget {
  const BasicDataNumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Стандартный с видом на бассейн или сад'),
        Row(
          children: [Text('Все включено'), Text('Кондиционер')],
        ),
        Row(
          children: [Text('Подробнее о номере'), Icon(Icons.next_plan)],
        ),
        Row(
          children: [Text('186 600 ₽'), Text('за 7 ночей с перелётом')],
        ),
        SelectNumberButton()
      ],
    );
  }
}
