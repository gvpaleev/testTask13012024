// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roomDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomList _$RoomListFromJson(Map<String, dynamic> json) => RoomList(
      rooms: (json['rooms'] as List<dynamic>)
          .map((e) => Room.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RoomListToJson(RoomList instance) => <String, dynamic>{
      'номера': instance.rooms,
    };

Room _$RoomFromJson(Map<String, dynamic> json) => Room(
      identifier: json['id'] as int,
      name: json['name'] as String,
      price: json['price'] as int,
      pricePer: json['price_per'] as String,
      peculiarities: (json['peculiarities'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      imageUrls: (json['image_urls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$RoomToJson(Room instance) => <String, dynamic>{
      'идентификатор': instance.identifier,
      'name': instance.name,
      'цена': instance.price,
      'price_per': instance.pricePer,
      'особенности': instance.peculiarities,
      'image_urls': instance.imageUrls,
    };
