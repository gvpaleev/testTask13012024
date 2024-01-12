import 'dart:ffi';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:effective_mobile_test_tasck/carousel_with_indicator.dart';
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
                    // Positioned(
                    //   bottom: 0.0,
                    //   left: 0.0,
                    //   right: 0.0,
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       gradient: LinearGradient(
                    //         colors: [
                    //           Color.fromARGB(200, 0, 0, 0),
                    //           Color.fromARGB(0, 0, 0, 0)
                    //         ],
                    //         begin: Alignment.bottomCenter,
                    //         end: Alignment.topCenter,
                    //       ),
                    //     ),
                    //     padding: EdgeInsets.symmetric(
                    //         vertical: 10.0, horizontal: 20.0),
                    //     child: Text(
                    //       'No. ${imgList.indexOf(item)} image',
                    //       style: TextStyle(
                    //         color: Colors.white,
                    //         fontSize: 20.0,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    //   ),
                    // ),
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
            '/': (ctx) => ScreenHotel(),
          },
        );
      },
      valueListenable: themeMode,
    );
  }
}

class ScreenHotel extends StatelessWidget {
  const ScreenHotel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Отель'))),
      body: CarouselSliderHostel(),
    );
  }
}
