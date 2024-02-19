part of 'hotel_card_bloc.dart';

@immutable
sealed class HotelCardState {
  final HotelCartDto? data;
  HotelCardState({this.data});
}

final class HotelCardBlocInitialState extends HotelCardState {
  HotelCardBlocInitialState();
}

final class HotelCardUpdateState extends HotelCardState {
  HotelCardUpdateState({required super.data});
}
