import 'package:bloc/bloc.dart';
import 'package:effective_mobile_test_tasck/shared/JsonDto/hotelDto.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';

part 'hotel_card_event.dart';
part 'hotel_card_state.dart';

class HotelCardBloc extends Bloc<HotelCardEvent, HotelCardState> {
  HotelCardBloc() : super(HotelCardBlocInitialState()) {
    on<HotelCardUpdateEvent>(
        _updateState as EventHandler<HotelCardEvent, HotelCardState>);
    add(HotelCardUpdateEvent());
  }

  _updateState(HotelCardEvent event, Emitter<HotelCardState> emit) async {
    final dio = Dio();
    final response = await dio.get('https://dart.dev');
    // add(event);
    print(response);
  }
}
