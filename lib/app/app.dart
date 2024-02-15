import 'package:effective_mobile_test_tasck/pages/screen_booking.dart';
import 'package:effective_mobile_test_tasck/pages/screen_finifsh.dart';
import 'package:effective_mobile_test_tasck/pages/screen_hotel.dart';
import 'package:effective_mobile_test_tasck/pages/screen_number.dart';
import 'package:effective_mobile_test_tasck/shared/bloc/hotel_card_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = HotelCardBloc();
// final HotelCardBloc sss = ;

    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.white, // ваш цвет AppBar
        ),
      ),
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/finishScreen': (ctx) => ScreenFinish(),
        '/bookingScreen': (ctx) => BookingScreen(),
        '/roomScreen': (ctx) => RoomScreen(),
        '/': (ctx) =>
            Container(child: BlocBuilder<HotelCardBloc, HotelCardState>(
              builder: (context, state) {
                return HotelScreen();
              },
            )),
      },
    );
  }
}
