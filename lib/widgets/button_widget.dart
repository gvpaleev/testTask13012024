import 'package:effective_mobile_test_tasck/shared/button_widget.dart';
import 'package:effective_mobile_test_tasck/shared/repository/hotelDto.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.stateData,
  });

  final HotelCartDto? stateData;

  @override
  Widget build(BuildContext context) {
    return stateData == null
        ? Container()
        : Container(
            padding:
                const EdgeInsets.only(top: 12, bottom: 28, left: 16, right: 16),
            decoration: const BoxDecoration(color: Colors.white),
            child: ButtonWidget2(
                title: 'К выбору номера',
                pathNext: '/roomScreen',
                arguments: stateData!.name),
          );
  }
}
