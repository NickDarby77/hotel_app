import 'package:dio/dio.dart';
import 'package:hotel_app/data/models/rooms_model.dart';

class RoomRepository {
  final Dio dio;
  RoomRepository({required this.dio});

  Future<RoomsModel> getRoomData({
    int? id,
    String? name,
    int? price,
    String? pricePer,
    List<String>? peculiarities,
    List<String>? imageUrls,
  }) async {
    final Response response = await dio.get(
        'https://run.mocky.io/v3/157ea342-a8a3-4e00-a8e6-a87d170aa0a2',
        queryParameters: {
          "id": id,
          "name": name,
          "price": price,
          "pricePer": pricePer,
          "peculiarities": peculiarities,
          "imageUrls": imageUrls,
        });

    return RoomsModel.fromJson(response.data);
  }
}
