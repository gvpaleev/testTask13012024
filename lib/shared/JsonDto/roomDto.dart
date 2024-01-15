import 'package:json_annotation/json_annotation.dart';

part 'roomDto.g.dart';

@JsonSerializable()
class RoomList {
  @JsonKey(name: 'номера')
  List<Room> rooms;

  RoomList({required this.rooms});

  factory RoomList.fromJson(Map<String, dynamic> json) => _$RoomListFromJson(json);

  Map<String, dynamic> toJson() => _$RoomListToJson(this);
}

@JsonSerializable()
class Room {
  @JsonKey(name: 'идентификатор')
  int identifier;
  String name;
  @JsonKey(name: 'цена')
  int price;
  @JsonKey(name: 'price_per')
  String pricePer;
  @JsonKey(name: 'особенности')
  List<String> peculiarities;
  @JsonKey(name: 'image_urls')
  List<String> imageUrls;

  Room({
    required this.identifier,
    required this.name,
    required this.price,
    required this.pricePer,
    required this.peculiarities,
    required this.imageUrls,
  });

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  Map<String, dynamic> toJson() => _$RoomToJson(this);
}
