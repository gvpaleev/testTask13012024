import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/io_client.dart';
import 'package:flutter/material.dart';

class CarouselSliderImgs extends StatefulWidget {
  late List<Widget> imageSliders;
  CarouselSliderImgs(List<String> imgs)
       {

        this.imageSliders = imgs
            .map((item) => Container(
                  child: Container(
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        child: Stack(
                          children: <Widget>[
                            FutureBuilder(
                        future: _fetchImageData(item.replaceAll(' ', '')),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return Image.memory(
                              snapshot.data as Uint8List,
                              fit: BoxFit.cover,
                              width: 1000.0,
                            );
                          }
                        },
                      ),
                            // Image.network(item.replaceAll(' ', ''),
                            //     fit: BoxFit.cover, width: 1000.0,),
                          ],
                        )),
                  ),
                ))
            .toList();
            }

  Future<Uint8List> _fetchImageData(String url) async {
            final HttpClient _httpclient = new HttpClient()

   ..badCertificateCallback = ((X509Certificate cert, String host, int port) {

   debugPrint("CSS Error customer");

   return true;

});
    try {
      var uri = Uri.parse(url);

      // Отключаем проверку SSL сертификата
      var response = await (await _httpclient.getUrl(uri)).close();
      if (response.statusCode == 200) {
        final List<int> bytes = await response.fold<List<int>>([], (List<int> acc, List<int> chunk) => acc..addAll(chunk));
      final Uint8List uint8List = Uint8List.fromList(bytes);
        return uint8List;
      } else {
        print('Request failed with status: ${response.statusCode}');
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Error: $e');
    }
  }
  
  @override
  State<StatefulWidget> createState() {
    return _CarouselSliderImg();
  }
  
}

class _CarouselSliderImg extends State<CarouselSliderImgs> {
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
