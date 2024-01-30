part of 'rooms_bloc.dart';

@immutable
sealed class RoomsEvent {}

// ignore: must_be_immutable
final class GetRoomsEvent extends RoomsEvent {
  int? id;
  String? name;
  int? price;
  String? pricePer;
  List<String>? peculiarities;
  List<String>? imageUrls;

  GetRoomsEvent({
    this.id,
    this.name,
    this.price,
    this.pricePer,
    this.peculiarities,
    this.imageUrls,
  });
}
