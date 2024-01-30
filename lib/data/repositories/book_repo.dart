import 'package:dio/dio.dart';
import 'package:hotel_app/data/models/book_model.dart';

class BookRepository {
  final Dio dio;
  BookRepository({required this.dio});

  Future<BookModel> getBookData({
    int? id,
    String? hotelName,
    String? hotelAdress,
    int? horating,
    String? ratingName,
    String? departure,
    String? arrivalCountry,
    String? tourDateStart,
    String? tourDateStop,
    int? numberOfNights,
    String? room,
    String? nutrition,
    int? tourPrice,
    int? fuelCharge,
    int? serviceCharge,
  }) async {
    final Response response = await dio.get(
        'https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff',
        queryParameters: {
          "id": id,
          "hotelName": hotelName,
          "hotelAdress": hotelAdress,
          "horating": horating,
          "ratingName": ratingName,
          "departure": departure,
          "arrivalCountry": arrivalCountry,
          "tourDateStart": tourDateStart,
          "tourDateStop": tourDateStop,
          "numberOfNights": numberOfNights,
          "room": room,
          "nutrition": nutrition,
          "tourPrice": tourPrice,
          "fuelCharge": fuelCharge,
          "serviceCharge": serviceCharge,
        });

    return BookModel.fromJson(response.data);
  }
}
