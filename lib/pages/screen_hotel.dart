import 'package:effective_mobile_test_tasck/shared/carousel_with_indicator.dart';
import 'package:effective_mobile_test_tasck/shared/basic_data_hotel.dart';
import 'package:effective_mobile_test_tasck/shared/detailed_data_hotel.dart';
import 'package:effective_mobile_test_tasck/shared/price_hotel.dart';
import 'package:effective_mobile_test_tasck/shared/select_number_button.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final List<String> imgList = [
  'https://storage.picsave.pp.ua/cluster1/origin/607a91c089965b7ddd6a4493eb9ce43b.jpg',
  'https://img.desktopwallpapers.ru/nature/pics/wide/1920x1200/3273d664f1f1a28b889e2af3a7dde2dd.jpg',
  'https://s1.1zoom.me/b6969/215/Maldives_Resorts_Sea_Houses_560367_1920x1080.jpg',
  'https://wpapers.ru/wallpapers/nature/13206/1920x1080_%D0%9C%D0%B0%D0%BB%D1%8C%D0%B4%D0%B8%D0%B2%D1%8B.jpg',
  'https://img2.akspic.ru/crops/6/8/0/9/69086/69086-more-bassejn-karibskij_bassejn-otpusk-otel-1920x1080.jpg'
];

class ScreenHotel extends StatefulWidget {
  ScreenHotel({super.key});

  @override
  State<ScreenHotel> createState() => _ScreenHotelState();
}

class _ScreenHotelState extends State<ScreenHotel> {
  late Future<String> data;
  void initState() {
    super.initState();
    // Вызываем метод для выполнения HTTP-запроса при инициализации виджета
    data = fetchData();
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
            future: data,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Если данные загружаются, отображаем индикатор загрузки
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                // Если произошла ошибка, отображаем сообщение об ошибке
                return Text('Error: ${snapshot.error}');
              } else {
                // Если данные получены успешно, отображаем их
                print(snapshot.data);
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: ListView(
                    children: [
                      CarouselSliderImg(imgList),
                      SizedBox(
                        height: 21,
                      ),
                      BasicDataHotel(),
                      SizedBox(
                        height: 10,
                      ),
                      PriceHotel(),
                      SizedBox(
                        height: 8,
                      ),
                      DetailedDataHotel(),
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
