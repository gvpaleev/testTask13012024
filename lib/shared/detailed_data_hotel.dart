import 'package:effective_mobile_test_tasck/shared/JsonDto/hotelDto.dart';
import 'package:effective_mobile_test_tasck/shared/text__sf_pro_14__widget.dart';
import 'package:effective_mobile_test_tasck/shared/text__sf_pro_16__widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailedDataHotel extends StatelessWidget {
  final AboutTheHotel aboutTheHotel;
  const DetailedDataHotel({super.key, required this.aboutTheHotel});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: 16,
      ),
      // HeaderWidget(),
      SizedBox(
        height: 16,
      ),
      // DivCharacteristicsWidget(peculiarities: aboutTheHotel.peculiarities),
      SizedBox(
        height: 12,
      ),
      DescriptionHotelWidget(description: aboutTheHotel.description),
      SizedBox(
        height: 16,
      ),
      BlockDetailedPoints()
    ]);
  }
}

// class HeaderWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       'Об отеле',
//       style: TextStyle(
//         color: Colors.black,
//         fontSize: 22,
//         fontFamily: 'SF Pro Display',
//         fontWeight: FontWeight.w500,
//       ),
//     );
//   }
// }

// class DivCharacteristicsWidget extends StatelessWidget {
//   final List<String> peculiarities;
//   DivCharacteristicsWidget({required this.peculiarities});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Wrap(
//         spacing: 8.0, // Расстояние между элементами по горизонтали
//         runSpacing: 8.0,
//         children: peculiarities
//             .map((e) => Container(
//                 decoration: BoxDecoration(
//                     color: Color(0xFFFBFBFC),
//                     borderRadius: BorderRadius.circular(5)),
//                 child:
//                     Text_SFPro_16_Widget(title: e, color: Color(0xFF828796))))
//             .toList(),
//       ),
//     );
//   }
// }

class DescriptionHotelWidget extends StatelessWidget {
  final String description;
  DescriptionHotelWidget({required this.description});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 343,
          child: Text(
            this.description,
            style: TextStyle(
              color: Colors.black.withOpacity(0.8999999761581421),
              fontSize: 16,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}

class BlockDetailedPoints extends StatelessWidget {
  final List<List<String>> data = [
    [
      'assets/emoji-happy.svg',
      'Удобства',
      'Самое необходимое',
      'assets/Vector 55.svg'
    ],
    [],
    [
      'assets/tick-square.svg',
      'Что включено',
      'Самое необходимое',
      'assets/Vector 55.svg'
    ],
    [],
    [
      'assets/close-square.svg',
      'Что не включено',
      'Самое необходимое',
      'assets/Vector 55.svg'
    ],
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
          children: data
              .map((elem) => elem.length > 0
                  ? Row(
                      children: [
                        SvgPicture.asset(
                          elem[0],
                          width: 24.0, // Ширина изображения
                          height: 24.0, // Высота изображения
                        ),
                        // Icon(Icons.star),
                        SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text_SFPro_16_Widget(
                              title: elem[1],
                              color: Color(0xFF2C3035),
                            ),
                            Text_SFPro_14_Widget(
                                title: elem[2], color: Color(0xFF828696))
                          ],
                        ),
                        Expanded(child: Container()),
                        SvgPicture.asset(
                          elem[3],
                          width: 24.0, // Ширина изображения
                          height: 24.0, // Высота изображения
                        ),
                      ],
                    )
                  : Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                              width: 310,
                              height: 0.5,
                              color: const Color.fromARGB(130, 135, 150, 15)),
                        ],
                      ),
                    ))
              .toList()),
    );
  }
}
