import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:hotel_app/data/models/rooms_model.dart';
import 'package:hotel_app/data/repositories/room_repo.dart';
import 'package:meta/meta.dart';

part 'rooms_event.dart';
part 'rooms_state.dart';

class RoomsBloc extends Bloc<RoomsEvent, RoomsState> {
  final RoomRepository repository;

  RoomsBloc({required this.repository}) : super(RoomsInitial()) {
    on<GetRoomsEvent>(
      (event, emit) async {
        emit(RoomsLoading());

        try {
          final result = await repository.getRoomData(
            id: event.id,
            name: event.name,
            price: event.price,
            pricePer: event.pricePer,
            peculiarities: event.peculiarities,
            imageUrls: event.imageUrls,
          );
          emit(
            RoomsSuccess(roomsModel: result),
          );
        } catch (e) {
          if (e is DioException) {
            emit(
              RoomsError(errorText: e.response?.data.toString() ?? ''),
            );
          } else {
            emit(RoomsError(errorText: e.toString()));
          }
        }
      },
    );
  }
}
