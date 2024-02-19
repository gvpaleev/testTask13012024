import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'booking_screen_event.dart';
part 'booking_screen_state.dart';

class BookingScreenBloc extends Bloc<BookingScreenEvent, BookingScreenState> {
  BookingScreenBloc() : super(BookingScreenInitial()) {
    on<BookingScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
