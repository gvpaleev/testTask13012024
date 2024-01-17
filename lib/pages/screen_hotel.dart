import 'dart:convert';

import 'package:effective_mobile_test_tasck/shared/JsonDto/hotelDto.dart';
import 'package:effective_mobile_test_tasck/shared/apiClient.dart';
import 'package:effective_mobile_test_tasck/widgets/carousel_with_indicator.dart';
import 'package:effective_mobile_test_tasck/widgets/basic_data_hotel.dart';
import 'package:effective_mobile_test_tasck/shared/detailed_data_hotel.dart';
import 'package:effective_mobile_test_tasck/widgets/price_hotel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HotelScreen extends StatefulWidget {
  HotelScreen({super.key});

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  late Future<HotelDto> stateHotelFuture;
  late HotelDto stateData;

  void initState() {
    super.initState();
    // Вызываем метод для выполнения HTTP-запроса при инициализации виджета
    stateHotelFuture = ApiClient.getHotelData();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Отель')),
        toolbarHeight: 57,
      ),
      body: Center(
        child: FutureBuilder(
            future: ApiClient.getHotelData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Если данные загружаются, отображаем индикатор загрузки
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                // Если произошла ошибка, отображаем сообщение об ошибке
                return Text('Error: ${snapshot.error}');
              } else {
                // Если данные получены успешно, отображаем их
                stateData = snapshot.data!;
                // print(this.data['image_urls']);

                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: ListView(
                    children: [
                      CarouselSliderImgs(stateData.imageUrls
                          .cast<String>()
                          .toList()),
                      const SizedBox(
                        height: 21,
                      ),
                      BasicDataHotel(
                        name: stateData.name,
                        address: stateData.address,
                        rating:
                            '${stateData.rating} ${stateData.ratingName}',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      HotelPrice(
                        minimalPrice: stateData.minimalPrice,
                        priceForIt: stateData.priceForIt,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      DetailedDataHotel(
                          aboutTheHotel: stateData.aboutTheHotel) 
                          ,
                      SizedBox(
                        height: 12,
                      ),
                      ButtonWidget(
                        title: 'К выбору номера',
                      )
                    ],
                  ),
                );
              }
            }),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  final String title;
  ButtonWidget({required this.title});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          // Обработчик нажатия кнопки
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
