import 'package:effective_mobile_test_tasck/shared/JsonDto/hotelDto.dart';
import 'package:effective_mobile_test_tasck/shared/apiClient.dart';
import 'package:effective_mobile_test_tasck/shared/button_widget.dart';
import 'package:effective_mobile_test_tasck/shared/my_app_bar.dart';
import 'package:effective_mobile_test_tasck/shared/text__sf_pro_16__widget.dart';
import 'package:effective_mobile_test_tasck/shared/text__sf_pro_22__widget.dart';
import 'package:effective_mobile_test_tasck/widgets/block_hotel_general_information.dart';
import 'package:effective_mobile_test_tasck/shared/detailed_data_hotel.dart';
import 'package:flutter/material.dart';

class HotelScreen extends StatelessWidget {
  const HotelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Отель',
      ),
      extendBody: true,
      body: MyHotelBody(),
    );
  }
}

class MyHotelBody extends StatefulWidget {
  const MyHotelBody({
    super.key,
  });

  @override
  State<MyHotelBody> createState() => _MyHotelBodyState();
}

class _MyHotelBodyState extends State<MyHotelBody> {
  late Future<HotelCartDto> stateHotelFuture;
  late HotelCartDto stateData;

  @override
  void initState() {
    super.initState();
    // Вызываем метод для выполнения HTTP-запроса при инициализации виджета
    stateHotelFuture = ApiClient.getHotelData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Center(
        child: FutureBuilder(
            future: stateHotelFuture,
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
                  decoration: BoxDecoration(
                    color: Color(0xFFF6F6F9),
                  ),
                  child: ListView(
                    children: [
                      BlockHotelGeneralInformation(stateData: stateData),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0))),
                        padding: const EdgeInsets.all(16),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text_SFPro_22_Widget(
                                title: 'Об отеле',
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Container(
                                child: Wrap(
                                  spacing:
                                      8.0, // Расстояние между элементами по горизонтали
                                  runSpacing: 8.0,
                                  children: stateData
                                      .aboutTheHotel.peculiarities
                                      .map((e) => Container(
                                          decoration: BoxDecoration(
                                              color: Color(0xFFFBFBFC),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Text_SFPro_16_Widget(
                                              title: e,
                                              color: Color(0xFF828796))))
                                      .toList(),
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Text_SFPro_16_Widget(
                                title: stateData.aboutTheHotel.description,
                                fontWeigh: FontWeight.w400,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              BlockDetailedPoints(),
                            ]),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            top: 12, bottom: 28, left: 16, right: 16),
                        decoration: const BoxDecoration(color: Colors.white),
                        child: ButtonWidget(
                            title: 'К выбору номера',
                            pathNext: '/roomScreen',
                            arguments: stateData.name),
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
