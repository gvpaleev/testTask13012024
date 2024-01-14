import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:effective_mobile_test_tasck/main.dart';
import 'package:flutter/material.dart';

// final List<Widget> imageSliders = imgList
//     .map((item) => Container(
//           child: Container(
//             margin: EdgeInsets.all(5.0),
//             child: ClipRRect(
//                 borderRadius: BorderRadius.all(Radius.circular(5.0)),
//                 child: Stack(
//                   children: <Widget>[
//                     Image.network(item, fit: BoxFit.cover, width: 1000.0),
//                   ],
//                 )),
//           ),
//         ))
//     .toList();

class CarouselSliderImg extends StatefulWidget {
  final List<Widget> imageSliders;

  CarouselSliderImg(List<String> imgs)
      : imageSliders = imgs
            .map((item) => Container(
                  child: Container(
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        child: Stack(
                          children: <Widget>[
                            Image.network(item,
                                fit: BoxFit.cover, width: 1000.0),
                          ],
                        )),
                  ),
                ))
            .toList();

  @override
  State<StatefulWidget> createState() {
    return _CarouselSliderImg();
  }
}

class _CarouselSliderImg extends State<CarouselSliderImg> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 257,
      // decoration: ShapeDecoration(
      //     shape:
      //         RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
      child: Stack(children: [
        Container(
          child: CarouselSlider(
            items: widget.imageSliders,
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
          bottom: 0,
          child: Container(
            padding: EdgeInsets.only(bottom: 8),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 7.5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  // width: 200,
                  // color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.imageSliders.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Container(
                          width: 7.0,
                          height: 7.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 5, horizontal: 2.5),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? const Color.fromARGB(255, 255, 255, 255)
                                      : Color.fromARGB(255, 0, 0, 0))
                                  .withOpacity(_current == entry.key
                                      ? 1
                                      : entry.key < _current
                                          ? ((widget.imageSliders.length -
                                                      (_current - entry.key)) /
                                                  widget.imageSliders.length) /
                                              2.5
                                          : ((widget.imageSliders.length -
                                                      (entry.key - _current)) /
                                                  widget.imageSliders.length) /
                                              2.5)),
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
