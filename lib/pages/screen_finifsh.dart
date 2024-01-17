import 'dart:convert';

import 'package:effective_mobile_test_tasck/pages/screen_hotel.dart';
import 'package:effective_mobile_test_tasck/shared/button_widget.dart';
import 'package:effective_mobile_test_tasck/shared/text__sf_pro_16__widget.dart';
import 'package:effective_mobile_test_tasck/shared/text__sf_pro_22__widget.dart';
import 'package:effective_mobile_test_tasck/widgets/carousel_with_indicator.dart';
import 'package:effective_mobile_test_tasck/widgets/basic_data_hotel.dart';
import 'package:effective_mobile_test_tasck/shared/detailed_data_hotel.dart';
import 'package:effective_mobile_test_tasck/widgets/price_hotel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ScreenFinish extends StatelessWidget {
  const ScreenFinish({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Заказ оплачен')),
        ),
        body: Container(
            padding: EdgeInsets.all(23),
            width: double.infinity,
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 122,
                  ),
                  Container(
                      padding: EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color.fromARGB(131, 23, 23, 168),
                      ),
                      child: Image.asset(
                        'assets/finish.png',
                        width: 72,
                        height: 72,
                      )),
                  SizedBox(
                    height: 32,
                  ),
                  Text_SFPro_22_Widget(
                      title: 'Ваш заказ принят в работу', color: Colors.black),
                  SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF828796),
                      fontSize: 16,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Expanded(child: Container()),
                  Container(
                    padding: EdgeInsets.only(top: 15, bottom: 14),
                    width: double.infinity,
                    // child: ButtonWidget(
                    //   title: 'Супер!',
                    // ),
                  )
                ])));
  }
}
