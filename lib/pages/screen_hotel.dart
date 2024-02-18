import 'package:effective_mobile_test_tasck/shared/apiClient.dart';
import 'package:effective_mobile_test_tasck/shared/bloc/hotel_card_bloc.dart';
import 'package:effective_mobile_test_tasck/shared/button_widget.dart';
import 'package:effective_mobile_test_tasck/shared/my_app_bar.dart';
import 'package:effective_mobile_test_tasck/shared/repository/hotelDto.dart';
import 'package:effective_mobile_test_tasck/widgets/block_hotel_general_information.dart';
import 'package:effective_mobile_test_tasck/shared/detailed_data_hotel.dart';
import 'package:effective_mobile_test_tasck/widgets/button_widget.dart';
import 'package:effective_mobile_test_tasck/widgets/description_hotel_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF6F6F9),
        ),
        child: ListView(
          children: [
            BlocBuilder<HotelCardBloc, HotelCardState>(
              builder: (context, state) {
                return BlockHotelGeneralInformation(stateData: state.data);
              },
            ),
            const SizedBox(
              height: 8,
            ),
            BlocBuilder<HotelCardBloc, HotelCardState>(
              builder: (context, state) {
                // return DescriptionHotelWidget(description: state.data);
                return DescriptionHotelWidget(stateData: state.data);
              },
            ),
            const SizedBox(
              height: 12,
            ),
            BlocBuilder<HotelCardBloc, HotelCardState>(
              builder: (context, state) {
                return ButtonWidget(stateData: state.data);
              },
            )
          ],
        ),
      )),
    );
  }
}
