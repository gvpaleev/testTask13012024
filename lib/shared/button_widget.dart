import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final String pathNext;
  final String arguments;
  const ButtonWidget(
      {super.key,
      required this.title,
      this.pathNext = '/',
      this.arguments = ''});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, pathNext, arguments: arguments);
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // Цвет фона кнопки
            // onPrimary: Colors.white, // Цвет текста на кнопке
            padding: EdgeInsets.only(top: 15, bottom: 14), // Отступы
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0), // Закругленные углы
            )),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w500,
            letterSpacing: 0.10,
          ),
        ));
  }
}
