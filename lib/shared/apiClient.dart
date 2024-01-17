import 'dart:convert';

import 'package:effective_mobile_test_tasck/shared/JsonDto/hotelDto.dart';
import 'package:effective_mobile_test_tasck/shared/JsonDto/roomDto.dart';
import 'package:http/http.dart' as http;

abstract class ApiClient {
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

  static Future<RoomList> getRoomsData() async {
    // URL для GET-запроса

    String url = 'https://run.mocky.io/v3/e28ae1b9-2033-4d13-83e0-9f6c046b2f4a';

    // Выполняем GET-запрос
    final response = await http.get(Uri.parse(url));

    // Проверяем успешность запроса
    if (response.statusCode == 200) {
      // List<RoomList> rooms = jsonData.map((item) => RoomList.fromJson(item)).toList();
      return RoomList.fromJson(
          jsonDecode(response.body.replaceAll('«', '"').replaceAll('»', '"')));
    } else {
      // Обрабатываем ошибку, если запрос не успешен
      // print(response.statusCode);
      throw Exception('Error: ${response.statusCode}');
    }
  }
}
