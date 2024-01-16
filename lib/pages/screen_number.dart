import 'dart:convert';
import 'dart:io';
import 'package:effective_mobile_test_tasck/pages/screen_hotel.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:effective_mobile_test_tasck/shared/JsonDto/roomDto.dart';
import 'package:effective_mobile_test_tasck/shared/detailed_data_hotel.dart';
import 'package:effective_mobile_test_tasck/shared/text__sf_pro_16__widget.dart';
import 'package:effective_mobile_test_tasck/shared/text__sf_pro_22__widget.dart';
import 'package:effective_mobile_test_tasck/widgets/carousel_with_indicator.dart';
import 'package:effective_mobile_test_tasck/widgets/price_hotel.dart';
import 'package:effective_mobile_test_tasck/widgets/price_room.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class ScreenNumber extends StatefulWidget {
  const ScreenNumber({super.key});

  @override
  State<ScreenNumber> createState() => _ScreenNumberState();
}

class _ScreenNumberState extends State<ScreenNumber> {
  late Future<List<dynamic>> futureData;
  late List<dynamic> data;
  void initState() {
    super.initState();
    // Вызываем метод для выполнения HTTP-запроса при инициализации виджета
    futureData = fetchData();
  }
  Future<List<dynamic>>   fetchData() async {
    // URL для GET-запроса

    String url = 'https://run.mocky.io/v3/e28ae1b9-2033-4d13-83e0-9f6c046b2f4a';

    // Выполняем GET-запрос
    final response = await http.get(Uri.parse(url));

    // Проверяем успешность запроса
    if (response.statusCode == 200) {
      // Выводим ответ в консоль
      print(jsonDecode(response.body.replaceAll('«', '"').replaceAll('»', '"')).runtimeType);
      Map<String, dynamic> jsonData = jsonDecode(response.body.replaceAll('«', '"').replaceAll('»', '"'));
      // List<RoomList> rooms = jsonData.map((item) => RoomList.fromJson(item)).toList();
      return jsonData['номера'];
    } else {
      // Обрабатываем ошибку, если запрос не успешен
      print(response.statusCode);
      throw Exception('Error: ${response.statusCode}');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Steigenberger Makadi')),
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
                // dataScreenHotel = jsonDecode(snapshot.data!);
                // print(jsonDecode(snapshot.data!));
                // List<RoomDto> rooms = snapshot.data!;
                data = snapshot.data!;
                // print(rooms);

                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: ListView(
                    children: 
                      data.map((item){   return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
const SizedBox(height: 16,),

                          CarouselSliderImgs(item['image_urls'].cast<String>()),
                          const SizedBox(height: 8,)
,                          Text_SFPro_22_Widget(title: item['name'], color: Colors.black),
const SizedBox(height: 8,),
DivCharacteristicsWidget(peculiarities: item['особенности'].cast<String>()),
const SizedBox(height: 7,),
DetailsRoom(),
const SizedBox(height: 16,),

RoomPrice(minimalPrice: item['цена'], priceForIt: item['price_per']),
const SizedBox(height: 16,),

Container(
  width: double.infinity,
  child: ButtonWidget (
                          title: 'Выбрать номер',
                        ),
),
const SizedBox(height: 16,),
                        ],
                      );})
                    .toList()
                 
                    ,
                  ),
                );
              };
            }),
      ),
    );
  }
}

class DetailsRoom extends StatelessWidget {
  const DetailsRoom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, left: 10, right: 2, bottom: 5),
      decoration: ShapeDecoration(
        color: Color(0x190D72FF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text_SFPro_16_Widget(title: 'Подробнее о номере', color: Color(0xFF0D72FF))
          
          ,
          const SizedBox(width: 2),
          Container(
            padding: const EdgeInsets.only(top: 6, left: 10, right: 8, bottom: 6),
            child:  SvgPicture.asset(
                          'assets/Vector 55.svg',
                          width: 14.0, // Ширина изображения
                          height: 14.0, 
                          color: Color(0xFF0D72FF) ,// Высота изображения
                        )
              ,
            ),
          
        ],
      ),
    );
  }
}
