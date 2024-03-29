import 'package:effective_mobile_test_tasck/shared/apiClient.dart';
import 'package:effective_mobile_test_tasck/shared/bloc/number_screen_bloc.dart';
import 'package:effective_mobile_test_tasck/shared/button_widget.dart';
import 'package:effective_mobile_test_tasck/shared/my_app_bar.dart';
import 'package:effective_mobile_test_tasck/shared/repository/roomDto.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:effective_mobile_test_tasck/shared/text__sf_pro_16__widget.dart';
import 'package:effective_mobile_test_tasck/shared/text__sf_pro_22__widget.dart';
import 'package:effective_mobile_test_tasck/widgets/carousel_with_indicator.dart';
import 'package:effective_mobile_test_tasck/widgets/price_room.dart';
import 'package:flutter/material.dart';

class RoomScreen extends StatelessWidget {
  const RoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Номера',
        screen: 1,
      ),
      body: MyRoomsBody(),
    );
  }
}

class MyRoomsBody extends StatefulWidget {
  const MyRoomsBody({
    super.key,
  });

  @override
  State<MyRoomsBody> createState() => _MyRoomsBodyState();
}

class _MyRoomsBodyState extends State<MyRoomsBody> {
  // late Future<RoomList> stateRoomDto;
  // late RoomList stateData;

  @override
  void initState() {
    super.initState();
    // Вызываем метод для выполнения HTTP-запроса при инициализации виджета
    // stateRoomDto = ApiClient.getRoomsData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NumberScreenBloc, NumberScreenState>(
      builder: (context, state) {
        return Center(
          child: state.data == null
              ? Container()
              : Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF6F6F9),
                  ),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      ...state.data!.rooms.map((item) {
                        return Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0))),
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CarouselSliderImgs(item.imageUrls),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text_SFPro_22_Widget(
                                      title: item.name, color: Colors.black),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    child: Wrap(
                                      spacing:
                                          8.0, // Расстояние между элементами по горизонтали
                                      runSpacing: 8.0,
                                      children: item.peculiarities
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
                                    height: 8,
                                  ),
                                  DetailsRoom(),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  RoomPrice(
                                      minimalPrice: item.price,
                                      priceForIt: item.pricePer),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Container(
                                    width: double.infinity,
                                    child: ButtonWidget2(
                                        title: 'Выбрать номер',
                                        pathNext: '/bookingScreen'),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            )
                          ],
                        );
                      }),
                    ],
                  ),
                ),
          // FutureBuilder(
          //     future: stateRoomDto,
          //     builder: (context, snapshot) {
          //       if (snapshot.connectionState == ConnectionState.waiting) {
          //         return CircularProgressIndicator();
          //       } else if (snapshot.hasError) {
          //         return Text('Error: ${snapshot.error}');
          //       } else {
          //         stateData = snapshot.data!;

          // return ;
          //       }
          //     }),
        );
      },
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
          Text_SFPro_16_Widget(
              title: 'Подробнее о номере', color: Color(0xFF0D72FF)),
          const SizedBox(width: 2),
          Container(
            padding:
                const EdgeInsets.only(top: 6, left: 10, right: 8, bottom: 6),
            child: SvgPicture.asset(
              'assets/Vector 55.svg',
              width: 14.0, // Ширина изображения
              height: 14.0,
              color: Color(0xFF0D72FF), // Высота изображения
            ),
          ),
        ],
      ),
    );
  }
}
