part of 'rooms_bloc.dart';

@immutable
sealed class RoomsState {}

final class RoomsInitial extends RoomsState {}

final class RoomsLoading extends RoomsState {}

final class RoomsSuccess extends RoomsState {
  final RoomsModel roomsModel;
  RoomsSuccess({required this.roomsModel});
}

final class RoomsError extends RoomsState {
  final String errorText;
  RoomsError({required this.errorText});
}
