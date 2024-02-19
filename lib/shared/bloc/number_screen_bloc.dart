import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:effective_mobile_test_tasck/shared/repository/roomDto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:meta/meta.dart';

part 'number_screen_event.dart';
part 'number_screen_state.dart';

class NumberScreenBloc extends Bloc<NumberScreenEvent, NumberScreenState> {
  NumberScreenBloc() : super(NumberScreenInitial()) {
    on<NumberScreenUpdateEvent>(_updateState);
    add(NumberScreenUpdateEvent());
  }

  _updateState(NumberScreenEvent event, Emitter<NumberScreenState> emit) async {
    final dio = Dio();
    final response = await dio.get(dotenv.get('NUMBER_CARD_URL'));
    final RoomList roomList = RoomList.fromJson(response.data);
    emit(NumberScreenUpdate(data: roomList));
  }
}
