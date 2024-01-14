import 'package:effective_mobile_test_tasck/pages/screen_hotel.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        // '/': (ctx) => ScreenBooking(),
        // '/': (ctx) => ScreenNumber(),
        '/': (ctx) => ScreenHotel(),
      },
    );
  }
}
