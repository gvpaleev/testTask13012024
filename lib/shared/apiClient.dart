import 'dart:convert';

import 'package:effective_mobile_test_tasck/shared/JsonDto/hotelDto.dart';
import 'package:http/http.dart' as http;

abstract class ApiClient{
  ApiClient();


  static Future<HotelDto> getHotelData() async {
      
    String url = 'https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473';

    // Выполняем GET-запрос
    final response = await http.get(Uri.parse(url));

    // Проверяем успешность запроса
    if (response.statusCode == 200) {
      // Выводим ответ в консоль
      return HotelDto.fromJson(jsonDecode(response.body));
    } else {
      // Обрабатываем ошибку, если запрос не успешен
      return throw Exception('Error: ${response.statusCode}');
  }
}
}