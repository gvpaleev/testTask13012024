part of 'booking_screen_bloc.dart';

@immutable
sealed class BookingScreenState {
  final BookingDto? data;
  BookingScreenState({this.data});
}

final class BookingScreenInitial extends BookingScreenState {}

final class BookingScreenUpdate extends BookingScreenState {
  BookingScreenUpdate({required super.data});
}
