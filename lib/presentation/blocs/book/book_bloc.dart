import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:hotel_app/data/models/book_model.dart';
import 'package:hotel_app/data/repositories/book_repo.dart';
import 'package:meta/meta.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final BookRepository repository;

  BookBloc({required this.repository}) : super(BookInitial()) {
    on<GetBookEvent>((event, emit) async {
      emit(BookLoading());

      try {
        final result = await repository.getBookData(
          id: event.id,
          hotelName: event.hotelName,
          hotelAdress: event.hotelAdress,
          horating: event.horating,
          ratingName: event.ratingName,
          departure: event.departure,
          arrivalCountry: event.arrivalCountry,
          tourDateStart: event.tourDateStart,
          tourDateStop: event.tourDateStop,
          numberOfNights: event.numberOfNights,
          room: event.room,
          nutrition: event.nutrition,
          tourPrice: event.tourPrice,
          fuelCharge: event.fuelCharge,
          serviceCharge: event.serviceCharge,
        );

        emit(BookSuccess(bookModel: result));
      } catch (e) {
        if (e is DioException) {
          emit(
            BookError(
              errorText: e.response?.data.toString() ?? '',
            ),
          );
        } else {
          emit(
            BookError(errorText: e.toString()),
          );
        }
      }
    });
  }
}
