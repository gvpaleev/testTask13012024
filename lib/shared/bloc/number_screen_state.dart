part of 'number_screen_bloc.dart';

@immutable
sealed class NumberScreenState {
  final RoomList? data;
  NumberScreenState({this.data});
}

final class NumberScreenInitial extends NumberScreenState {}

final class NumberScreenUpdate extends NumberScreenState {
  NumberScreenUpdate({required super.data});
}
