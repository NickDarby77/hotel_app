import 'package:dio/dio.dart';
import 'package:hotel_app/data/models/hotel_model.dart';

class HotelRepository {
  final Dio dio;
  HotelRepository({required this.dio});

  Future<HotelModel> getHotelData({
    int? id,
    String? name,
    String? address,
    int? minimalPrice,
    String? priceForIt,
    int? rating,
    String? ratingName,
    List<String>? imageUrls,
    AboutTheHotel? aboutTheHotel,
  }) async {
    final Response response = await dio.get(
        'https://run.mocky.io/v3/75000507-da9a-43f8-a618-df698ea7176d',
        queryParameters: {
          "id": id,
          "name": name,
          "address": address,
          "minimalPrice": minimalPrice,
          "priceForIt": priceForIt,
          "rating": rating,
          "ratingName": ratingName,
          "imageUrls": imageUrls,
          "aboutTheHotel": aboutTheHotel,
        });

    return HotelModel.fromJson(response.data);
  }
}
