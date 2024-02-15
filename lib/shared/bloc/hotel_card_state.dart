part of 'hotel_card_bloc.dart';

@immutable
sealed class HotelCardState {
  final HotelCartDto? data;
  HotelCardState({this.data});
}

final class HotelCardBlocInitialState extends HotelCardState {
  HotelCardBlocInitialState();
}

final class HotelCardBlocUpdateState extends HotelCardState {
  HotelCardBlocUpdateState({required super.data});
}

// {
//  "id": 1,
//  "name": "Лучший пятизвездочный отель в Хургаде, Египет",
//  "adress": "Madinat Makadi, Safaga Road, Makadi Bay, Египет",
//  "minimal_price": 134268,
//  "price_for_it": "За тур с перелётом",
//  "rating": 5,
//  "rating_name": "Превосходно", 
//  "image_urls": ["https://www.atorus.ru/sites/default/files/upload/image/News/56149/Club_Priv%C3%A9_by_Belek_Club_House.jpg", "https://media.admagazine.ru/photos/61408b2f4311246f36873963/16:9/w_1280,c_limit/w2000%20-%202020-07-14T164056.159.jpg", "https://travelata.ru/blog/wp-content/uploads/2019/06/Starlight-Convention-Center-Thalasso-Spa.jpg"],
//  "about_the_hotel": {
//     "description": "Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!",
//     "peculiarities": ["Бесплатный Wifi на всей территории отеля", "1 км до пляжа", "Бесплатный фитнес-клуб", "20 км до аэропорта"]
    
//   }
// }