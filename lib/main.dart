import 'package:effective_mobile_test_tasck/pages/screen_booking.dart';
import 'package:effective_mobile_test_tasck/pages/screen_hotel.dart';
import 'package:effective_mobile_test_tasck/pages/screen_number.dart';
import 'package:effective_mobile_test_tasck/shared/carousel_with_indicator.dart';
import 'package:effective_mobile_test_tasck/shared/hotel_rating.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  'https://storage.picsave.pp.ua/cluster1/origin/607a91c089965b7ddd6a4493eb9ce43b.jpg',
  'https://img.desktopwallpapers.ru/nature/pics/wide/1920x1200/3273d664f1f1a28b889e2af3a7dde2dd.jpg',
  'https://s1.1zoom.me/b6969/215/Maldives_Resorts_Sea_Houses_560367_1920x1080.jpg',
  'https://wpapers.ru/wallpapers/nature/13206/1920x1080_%D0%9C%D0%B0%D0%BB%D1%8C%D0%B4%D0%B8%D0%B2%D1%8B.jpg',
  'https://img2.akspic.ru/crops/6/8/0/9/69086/69086-more-bassejn-karibskij_bassejn-otpusk-otel-1920x1080.jpg'
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                  ],
                )),
          ),
        ))
    .toList();

void main() => runApp(App());

final themeMode = ValueNotifier(2);

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, value, g) {
        return MaterialApp(
          initialRoute: '/',
          // darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.values.toList()[value as int],
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (ctx) => ScreenBooking(),
            // '/': (ctx) => ScreenNumber(),
            // '/': (ctx) => ScreenHotel(),
          },
        );
      },
      valueListenable: themeMode,
    );
  }
}
