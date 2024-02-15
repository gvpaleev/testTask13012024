import 'package:bloc/bloc.dart';
import 'package:effective_mobile_test_tasck/shared/JsonDto/hotelDto.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// import 'package:dotenv/dotenv.dart';
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
    final response = await dio.get(dotenv.get('HOTEL_CARD_URL'));
    final HotelCartDto hotelCartDto = HotelCartDto.fromJson(response.data);
    emit(HotelCardUpdateState(data: hotelCartDto));
  }
}
