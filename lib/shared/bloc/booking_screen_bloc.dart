import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:effective_mobile_test_tasck/shared/repository/bookingDto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:meta/meta.dart';

part 'booking_screen_event.dart';
part 'booking_screen_state.dart';

class BookingScreenBloc extends Bloc<BookingScreenEvent, BookingScreenState> {
  BookingScreenBloc() : super(BookingScreenInitial()) {
    on<BookingScreenEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<BookingScreenUpdateEvent>(_updateState);
    add(BookingScreenUpdateEvent());
  }
  _updateState(
      BookingScreenEvent event, Emitter<BookingScreenState> emit) async {
    final dio = Dio();
    final response = await dio.get(dotenv.get('BOOKING_CARD_URL'));
    final BookingDto bookingDto = BookingDto.fromJson(response.data);
    emit(BookingScreenUpdate(data: bookingDto));
  }
}
