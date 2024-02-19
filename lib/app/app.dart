import 'package:effective_mobile_test_tasck/pages/screen_booking.dart';
import 'package:effective_mobile_test_tasck/pages/screen_finifsh.dart';
import 'package:effective_mobile_test_tasck/pages/screen_hotel.dart';
import 'package:effective_mobile_test_tasck/pages/screen_number.dart';
import 'package:effective_mobile_test_tasck/shared/bloc/booking_screen_bloc.dart';
import 'package:effective_mobile_test_tasck/shared/bloc/hotel_card_bloc.dart';
import 'package:effective_mobile_test_tasck/shared/bloc/number_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = HotelCardBloc();
// final HotelCardBloc sss = ;

    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.white, // ваш цвет AppBar
        ),
      ),
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/finishScreen': (ctx) => const ScreenFinish(),
        '/bookingScreen': (ctx) => BlocProvider(
              create: (context) => BookingScreenBloc(),
              child: const BookingScreen(),
            ),
        '/roomScreen': (ctx) => BlocProvider(
              create: (context) => NumberScreenBloc(),
              child: const RoomScreen(),
            ),
        '/': (ctx) => BlocProvider<HotelCardBloc>(
              create: (context) => HotelCardBloc(),
              child: const HotelScreen(),
            ),
      },
    );
  }
}
