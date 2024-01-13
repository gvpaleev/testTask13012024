import 'package:flutter/material.dart';

class SelectNumberButton extends StatelessWidget {
  const SelectNumberButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Обработчик нажатия
        print('Кнопка нажата');
      },
      child: Text('Нажми меня'),
    );
  }
}
