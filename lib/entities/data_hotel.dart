import 'package:json_annotation/json_annotation.dart';

part 'data_hotel.g.dart';

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
class DataHotel {
  int id;
  String name;
  String address;
  int minimalPrice;
  String priceForIt;
  int rating;
  String ratingName;
  List<String> imageUrls;
  AboutTheHotel aboutTheHotel;

  DataHotel({
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

  factory DataHotel.fromJson(Map<String, dynamic> json) =>
      _$DataHotelFromJson(json);

  Map<String, dynamic> toJson() => _$DataHotelToJson(this);
}
