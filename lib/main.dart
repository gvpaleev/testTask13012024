import 'package:effective_mobile_test_tasck/app/app.dart';
import 'package:effective_mobile_test_tasck/shared/bloc/hotel_card_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:flutter/material.dart';

void main() async {
  await dotenv.load();
  runApp(App());
}

final HotelCardBloc sss = HotelCardBloc();
// sss.add();