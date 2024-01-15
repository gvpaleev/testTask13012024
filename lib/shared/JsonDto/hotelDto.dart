import 'package:json_annotation/json_annotation.dart';

part 'hotelDto.g.dart';

@JsonSerializable()
class AboutTheHotel {
  String description;
  List<String> peculiarities;

  AboutTheHotel({
    required this.description,
    required this.peculiarities,
  });

  factory AboutTheHotel.fromJson(Map<String, dynamic> json) =>
      _$AboutTheHotelFromJson(json);

  Map<String, dynamic> toJson() => _$AboutTheHotelToJson(this);
}

@JsonSerializable()
class HotelDto {
  int id;
  String name;
  String address;
  int minimalPrice;
  String priceForIt;
  int rating;
  String ratingName;
  List<String> imageUrls;
  AboutTheHotel aboutTheHotel;

  HotelDto({
    required this.id,
    required this.name,
    required this.address,
    required this.minimalPrice,
    required this.priceForIt,
    required this.rating,
    required this.ratingName,
    required this.imageUrls,
    required this.aboutTheHotel,
  });

  factory HotelDto.fromJson(Map<String, dynamic> json) =>
      _$HotelDtoFromJson(json);

  Map<String, dynamic> toJson() => _$HotelDtoToJson(this);
}
