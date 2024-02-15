part of 'hotel_card_bloc.dart';

@immutable
sealed class HotelCardEvent {}

final class HotelCardUpdateEvent extends HotelCardEvent {}
