import 'package:effective_mobile_test_tasck/shared/repository/hotelDto.dart';
import 'package:effective_mobile_test_tasck/widgets/basic_data_hotel.dart';
import 'package:effective_mobile_test_tasck/widgets/carousel_with_indicator.dart';
import 'package:effective_mobile_test_tasck/widgets/price_hotel.dart';
import 'package:flutter/material.dart';

class BlockHotelGeneralInformation extends StatelessWidget {
  const BlockHotelGeneralInformation({
    super.key,
    required this.stateData,
  });

  final HotelCartDto? stateData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          )),
      padding: const EdgeInsets.only(top: 5, left: 16, right: 16, bottom: 16),
      child: stateData == null
          ? Container()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSliderImgs(
                    stateData!.imageUrls.cast<String>().toList()),
                const SizedBox(
                  height: 16,
                ),
                BasicDataHotel(
                  name: stateData!.name,
                  address: stateData!.address,
                  rating: '${stateData!.rating} ${stateData!.ratingName}',
                ),
                const SizedBox(
                  height: 16,
                ),
                HotelPrice(
                  minimalPrice: stateData!.minimalPrice,
                  priceForIt: stateData!.priceForIt,
                ),
              ],
            ),
    );
  }
}
