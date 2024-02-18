import 'package:effective_mobile_test_tasck/shared/detailed_data_hotel.dart';
import 'package:effective_mobile_test_tasck/shared/repository/hotelDto.dart';
import 'package:effective_mobile_test_tasck/shared/text__sf_pro_16__widget.dart';
import 'package:effective_mobile_test_tasck/shared/text__sf_pro_22__widget.dart';
import 'package:flutter/material.dart';

class DescriptionHotelWidget extends StatelessWidget {
  const DescriptionHotelWidget({
    super.key,
    required this.stateData,
  });

  final HotelCartDto? stateData;

  @override
  Widget build(BuildContext context) {
    return stateData == null
        ? Container()
        : Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
            padding: const EdgeInsets.all(16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text_SFPro_22_Widget(
                title: 'Об отеле',
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                child: Wrap(
                  spacing: 8.0, // Расстояние между элементами по горизонтали
                  runSpacing: 8.0,
                  children: stateData!.aboutTheHotel.peculiarities
                      .map((e) => Container(
                          decoration: BoxDecoration(
                              color: Color(0xFFFBFBFC),
                              borderRadius: BorderRadius.circular(5)),
                          child: Text_SFPro_16_Widget(
                              title: e, color: Color(0xFF828796))))
                      .toList(),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text_SFPro_16_Widget(
                title: stateData!.aboutTheHotel.description,
                fontWeigh: FontWeight.w400,
              ),
              const SizedBox(
                height: 16,
              ),
              BlockDetailedPoints(),
            ]),
          );
  }
}
