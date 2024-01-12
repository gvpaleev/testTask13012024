import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:effective_mobile_test_tasck/main.dart';
import 'package:flutter/material.dart';

class CarouselSliderHostel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselSliderHostel();
  }
}

class _CarouselSliderHostel extends State<CarouselSliderHostel> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 257,
      child: Stack(children: [
        Container(
          child: CarouselSlider(
            items: imageSliders,
            carouselController: _controller,
            options: CarouselOptions(
                viewportFraction: 1,
                // disableCenter: true,
                // autoPlay: true,
                // enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        Positioned(
          bottom: 10,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 7.5, vertical: 2.5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  // width: 200,
                  // color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imgList.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Container(
                          width: 7.0,
                          height: 7.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 2.5),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? const Color.fromARGB(255, 255, 255, 255)
                                      : Color.fromARGB(255, 0, 0, 0))
                                  .withOpacity(_current == entry.key
                                      ? 1
                                      : entry.key < _current
                                          ? ((imgList.length -
                                                      (_current - entry.key)) /
                                                  imgList.length) /
                                              1.3
                                          : ((imgList.length -
                                                      (entry.key - _current)) /
                                                  imgList.length) /
                                              1.3)),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
