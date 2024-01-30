part of 'hotel_bloc.dart';

@immutable
sealed class HotelState {}

final class HotelInitial extends HotelState {}

final class HotelLoading extends HotelState {}

final class HotelSuccess extends HotelState {
  final HotelModel hotelModel;
  HotelSuccess({required this.hotelModel});
}

final class HotelError extends HotelState {
  final String errorText;
  HotelError({required this.errorText});
}
