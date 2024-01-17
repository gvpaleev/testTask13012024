// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotelDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AboutTheHotel _$AboutTheHotelFromJson(Map<String, dynamic> json) =>
    AboutTheHotel(
      description: json['description'] as String,
      peculiarities: (json['peculiarities'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$AboutTheHotelToJson(AboutTheHotel instance) =>
    <String, dynamic>{
      'description': instance.description,
      'peculiarities': instance.peculiarities,
    };

HotelDto _$HotelDtoFromJson(Map<String, dynamic> json) => HotelDto(
      id: json['id'] as int,
      name: json['name'] as String,
      address: json['adress'] as String,
      minimalPrice: json['minimal_price'] as int,
      priceForIt: json['price_for_it'] as String,
      rating: json['rating'] as int,
      ratingName: json['rating_name'] as String,
      imageUrls:
          (json['image_urls'] as List<dynamic>).map((e) => e as String).toList(),
      aboutTheHotel:
          AboutTheHotel.fromJson(json['about_the_hotel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HotelDtoToJson(HotelDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'minimalPrice': instance.minimalPrice,
      'priceForIt': instance.priceForIt,
      'rating': instance.rating,
      'ratingName': instance.ratingName,
      'imageUrls': instance.imageUrls,
      'aboutTheHotel': instance.aboutTheHotel,
    };
