import 'dart:convert';

import 'package:effective_mobile_test_tasck/widgets/carousel_with_indicator.dart';
import 'package:effective_mobile_test_tasck/widgets/basic_data_hotel.dart';
import 'package:effective_mobile_test_tasck/shared/detailed_data_hotel.dart';
import 'package:effective_mobile_test_tasck/widgets/price_hotel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ScreenHotel extends StatefulWidget {
  ScreenHotel({super.key});

  @override
  State<ScreenHotel> createState() => _ScreenHotelState();
}

class _ScreenHotelState extends State<ScreenHotel> {
  late Future<String> futureData;
  late Map<String, dynamic> dataScreenHotel;

  void initState() {
    super.initState();
    // Вызываем метод для выполнения HTTP-запроса при инициализации виджета
    futureData = fetchData();
  }

  Future<String> fetchData() async {
    // URL для GET-запроса
    String url = 'https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473';

    // Выполняем GET-запрос
    final response = await http.get(Uri.parse(url));

    // Проверяем успешность запроса
    if (response.statusCode == 200) {
      // Выводим ответ в консоль
      return response.body;
    } else {
      // Обрабатываем ошибку, если запрос не успешен
      return 'Error: ${response.statusCode}';
    }
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
            future: futureData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Если данные загружаются, отображаем индикатор загрузки
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                // Если произошла ошибка, отображаем сообщение об ошибке
                return Text('Error: ${snapshot.error}');
              } else {
                // Если данные получены успешно, отображаем их
                dataScreenHotel = jsonDecode(snapshot.data!);
                // print(this.data['image_urls']);

                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: ListView(
                    children: [
                      CarouselSliderImgs(dataScreenHotel['image_urls']
                          .cast<String>()
                          .toList()),
                      const SizedBox(
                        height: 21,
                      ),
                      BasicDataHotel(
                        name: dataScreenHotel['name'],
                        address: dataScreenHotel['adress'],
                        rating:
                            '${dataScreenHotel['rating']} ${dataScreenHotel['rating_name']}',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      HotelPrice(
                        minimalPrice: dataScreenHotel['minimal_price'],
                        priceForIt: dataScreenHotel['price_for_it'],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      DetailedDataHotel(
                          aboutTheHotel: jsonDecode(
                              snapshot.data ?? '')['about_the_hotel']),
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
