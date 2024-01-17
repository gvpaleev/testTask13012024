import 'dart:convert';
import 'package:effective_mobile_test_tasck/pages/screen_hotel.dart';
import 'package:effective_mobile_test_tasck/shared/JsonDto/bookingDto.dart';
import 'package:effective_mobile_test_tasck/shared/button_widget.dart';
import 'package:effective_mobile_test_tasck/shared/text__sf_pro_14__widget.dart';
import 'package:effective_mobile_test_tasck/shared/text__sf_pro_16__widget.dart';
import 'package:effective_mobile_test_tasck/shared/text__sf_pro_22__widget.dart';
import 'package:effective_mobile_test_tasck/widgets/basic_data_hotel.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  late Future<BookingDto> futureData;
  late BookingDto data;
  void initState() {
    super.initState();
    // Вызываем метод для выполнения HTTP-запроса при инициализации виджета
    futureData = fetchData();
  }

  Future<BookingDto> fetchData() async {
    // URL для GET-запроса

    String url = 'https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff';

    // Выполняем GET-запрос
    final response = await http.get(Uri.parse(url));

    // Проверяем успешность запроса
    if (response.statusCode == 200) {
      // Выводим ответ в консоль
      data = BookingDto.fromJson(jsonDecode(response.body));

      // print(data);

      return data;
      // throw Exception('Error: ${response.statusCode}');
    } else {
      // Обрабатываем ошибку, если запрос не успешен
      print(response.statusCode);
      throw Exception('Error: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Бронирование'))),
      body: Container(
        child: Center(
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
                  // Если данные получены успешно
                  return BodyBooking(
                    data: data,
                  );
                  // Container(
                  //   padding: EdgeInsets.symmetric(horizontal: 16),
                  //   child: ListView(children: [BodyBooking()]),
                  // );
                }
              }),
        ),
      ),
    );
  }
}

class BodyBooking extends StatelessWidget {
  late BookingDto data;
  BodyBooking({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            BasicDataHotel(
                name: data.hotelName,
                address: data.hotelAddress,
                rating: data.horating.toString() + ' ' + data.ratingName),
            InfoBooking(data: data),
            SizedBox(
              height: 100,
            ),
            InfoBuyer(),
            SizedBox(
              height: 16,
            ),
            TouristBlock(),
            InfoPriceBooking(data: data),
            ButtonWidget(title: 'Оплатить 198 036 ₽')
          ],
        ));
  }
}

class TouristBlock extends StatefulWidget {
  TouristBlock({
    super.key,
  });

  @override
  State<TouristBlock> createState() => _TouristBlockState();
}

class _TouristBlockState extends State<TouristBlock> {
  final List<String> elements = [
    '', 'Первый', 'Второй', 'Третий', 'Четвёртый', 'Пятый', 'Шестой',
    'Седьмой' // продолжите список
  ];

  int countEnable = 2;

  void increment() {
    if (elements.length > countEnable) {
      countEnable += 1;

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...elements
            .where((element) =>
                elements.indexOf(element) != 0 &&
                elements.indexOf(element) < countEnable)
            .toList()
            .map((element) => ExpansionPanelListExample(
                  title: element + ' турист',
                  flag: element == 'Первый',
                ))
            .toList(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 13),
          child: Row(
            children: [
              Text_SFPro_22_Widget(
                title: 'Добавить туриста',
                color: Colors.black,
              ),
              Expanded(
                child: Container(),
              ),
              Container(
                padding: EdgeInsets.all(0),
                decoration: BoxDecoration(
                    color: Color(0xFF0D72FF),
                    borderRadius: BorderRadius.circular(10)),
                child: IconButton(
                  icon: SvgPicture.asset('assets/frame609.svg'),
                  onPressed: () {
                    increment();
                    print('Button pressed');
                  },
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class InfoBuyer extends StatelessWidget {
  // Контроллеры для полей ввода
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  InfoBuyer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text_SFPro_22_Widget(
            title: 'Информация о покупателе', color: Colors.black),
        Form(
          child: Column(children: [
            // Поле ввода для имени
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Номер телефона',
                hintText: '+7 (***) ***-**-**',
                border: InputBorder.none,
              ),
              inputFormatters: [
                MaskTextInputFormatter(
                  mask:
                      '+7 (###) ###-##-##', // Задайте нужную маску для номера телефона
                  filter: {
                    "#": RegExp(r'[0-9]')
                  }, // Фильтр для разрешенных символов
                )
              ],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Пожалуйста, введите имя';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),

            // Поле ввода для электронной почты
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Почта',
                border: InputBorder.none,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Пожалуйста, введите адрес электронной почты';
                }
                // Дополнительные проверки формата электронной почты могут быть добавлены
                return null;
              },
            ),
            SizedBox(height: 16.0),

            // Кнопка отправки формы
            // ElevatedButton(
            //   onPressed: () {
            //     // Ваш код для обработки данных из формы
            //     String name = nameController.text;
            //     String email = emailController.text;

            //     // Ваша логика обработки данных
            //     print('Имя: $name, Электронная почта: $email');
            //   },
            //   child: Text('Отправить'),
            // ),
          ]),
        ),
        Text_SFPro_14_Widget(
          color: Color(0xFF828796),
          title:
              'Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту',
          fontWeigh: FontWeight.w400,
        )
      ]),
    );
  }
}

class InfoBooking extends StatelessWidget {
  final BookingDto data;
  const InfoBooking({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          lineInfoBooking(
            keyName: 'Вылет из',
            value: data.departure,
          ),
          SizedBox(
            height: 16,
          ),
          lineInfoBooking(
            keyName: 'Страна, город',
            value: data.arrivalCountry,
          ),
          SizedBox(
            height: 16,
          ),
          lineInfoBooking(
            keyName: 'Даты',
            value: data.tourDateStart,
          ),
          SizedBox(
            height: 16,
          ),
          lineInfoBooking(
            keyName: 'Кол-во ночей',
            value: data.numberOfNights.toString(),
          ),
          SizedBox(
            height: 16,
          ),
          lineInfoBooking(
            keyName: 'Отель',
            value: data.hotelName,
          ),
          SizedBox(
            height: 16,
          ),
          lineInfoBooking(
            keyName: 'Номер',
            value: data.room,
          ),
          SizedBox(
            height: 16,
          ),
          lineInfoBooking(
            keyName: 'Питание',
            value: data.nutrition,
          ),
        ],
      ),
    );
  }
}

class InfoPriceBooking extends StatelessWidget {
  final BookingDto data;
  const InfoPriceBooking({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          lineInfoBooking(
            keyName: 'Тур',
            value: data.departure,
            flag: true,
          ),
          SizedBox(
            height: 16,
          ),
          lineInfoBooking(
            keyName: 'Топливный сбор',
            value: data.arrivalCountry,
            flag: true,
          ),
          SizedBox(
            height: 16,
          ),
          lineInfoBooking(
            keyName: 'Сервисный сбор',
            value: data.tourDateStart,
            flag: true,
          ),
          SizedBox(
            height: 16,
          ),
          lineInfoBooking(
            keyName: 'К оплате',
            value: data.numberOfNights.toString(),
            flag: true,
          ),
        ],
      ),
    );
  }
}

class lineInfoBooking extends StatelessWidget {
  final String keyName;
  final String value;
  bool flag;

  lineInfoBooking(
      {super.key,
      required this.keyName,
      required this.value,
      this.flag = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text_SFPro_16_Widget(
          title: keyName,
          color: Color(0xFF828796),
          fontWeigh: FontWeight.w400,
        ),
        Expanded(child: Container()),
        flag
            ? Container(
                child: Text_SFPro_16_Widget(
                title: value,
                color: Colors.black,
                fontWeigh: FontWeight.w400,
              ))
            : Container(
                width: 203,
                child: Text_SFPro_16_Widget(
                  title: value,
                  color: Colors.black,
                  fontWeigh: FontWeight.w400,
                )),
      ],
    );
  }
}

class ExpansionPanelListExample extends StatefulWidget {
  final String title;
  bool flag = false;

  ExpansionPanelListExample(
      {super.key, required this.title, this.flag = false});

  @override
  State<ExpansionPanelListExample> createState() =>
      _ExpansionPanelListExampleState();
}

class _ExpansionPanelListExampleState extends State<ExpansionPanelListExample> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: ExpansionPanelList(
          elevation: 0,
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              widget.flag = isExpanded;
            });
          },
          children: [
            ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text_SFPro_22_Widget(
                    title: widget.title,
                    color: Colors.black,
                  ),
                );
              },
              body: formTourist(),
              isExpanded: widget.flag,
            )
          ],
        ),
      ),
    );
  }
}

class formTourist extends StatelessWidget {
  final DataTourist data = DataTourist();
  formTourist({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Form(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // TextFormField для ввода текста
            TextFormFieldW(
              name: 'Имя',
              controller: data.name,
            ),
            SizedBox(height: 16.0),
            TextFormFieldW(
              name: 'Фамилия',
              controller: data.surname,
            ),
            SizedBox(height: 16.0),
            TextFormFieldW(name: 'Дата рождения', controller: data.dateOfBirth),
            SizedBox(height: 16.0),
            TextFormFieldW(name: 'Гражданство', controller: data.citizenship),
            SizedBox(height: 16.0),
            TextFormFieldW(
                name: 'Номер загранпаспорта', controller: data.passportNumber),
            SizedBox(height: 16.0),
            TextFormFieldW(
                name: 'Срок действия загранпаспорта',
                controller: data.validityPeriodPassportNumber)
            // Кнопка для отправки формы
          ],
        ),
      ),
    ));
  }
}

class TextFormFieldW extends StatelessWidget {
  final String name;
  final TextEditingController controller;
  const TextFormFieldW(
      {super.key, required this.name, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: name,
        labelStyle: TextStyle(
          color: Color(0xFFA8ABB6), // Цвет текста labelText
          fontSize: 18.0, // Размер текста \
        ),
        filled: true,
        fillColor: Color(0xFFF6F6F9),
        border: OutlineInputBorder(
          // Определяем границы
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none, // Убираем границы
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your name';
        }
        return null;
      },
    );
  }
}

class DataTourist {
  late TextEditingController name;
  late TextEditingController surname;
  late TextEditingController dateOfBirth;
  late TextEditingController citizenship;
  late TextEditingController passportNumber;
  late TextEditingController validityPeriodPassportNumber;
  // Конструктор с именованными параметрами
  DataTourist() {
    this.name = TextEditingController();
    this.surname = TextEditingController();
    this.dateOfBirth = TextEditingController();
    this.citizenship = TextEditingController();
    this.passportNumber = TextEditingController();
    this.validityPeriodPassportNumber = TextEditingController();
  }
}
