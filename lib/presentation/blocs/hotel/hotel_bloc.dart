import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:hotel_app/data/models/hotel_model.dart';
import 'package:hotel_app/data/repositories/hotel_repository.dart';
import 'package:meta/meta.dart';

part 'hotel_event.dart';
part 'hotel_state.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  final HotelRepository repository;

  HotelBloc({required this.repository}) : super(HotelInitial()) {
    on<GetHotelEvent>((event, emit) async {
      emit(HotelLoading());

      try {
        final result = await repository.getHotelData(
          id: event.id,
          name: event.name,
          rating: event.rating,
          address: event.adress,
          imageUrls: event.imageUrls,
          ratingName: event.ratingName,
          priceForIt: event.priceForIt,
          minimalPrice: event.minimalPrice,
          aboutTheHotel: event.aboutTheHotel,
        );
        emit(HotelSuccess(hotelModel: result));
      } catch (e) {
        if (e is DioException) {
          emit(
            HotelError(errorText: e.response?.data.toString() ?? ''),
          );
        } else {
          emit(HotelError(errorText: e.toString()));
        }
      }
    });
  }
}
