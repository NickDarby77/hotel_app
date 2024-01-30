part of 'book_bloc.dart';

@immutable
sealed class BookEvent {}

// ignore: must_be_immutable
final class GetBookEvent extends BookEvent {
  int? id;
  String? hotelName;
  String? hotelAdress;
  int? horating;
  String? ratingName;
  String? departure;
  String? arrivalCountry;
  String? tourDateStart;
  String? tourDateStop;
  int? numberOfNights;
  String? room;
  String? nutrition;
  int? tourPrice;
  int? fuelCharge;
  int? serviceCharge;

  GetBookEvent({
    this.id,
    this.hotelName,
    this.hotelAdress,
    this.horating,
    this.ratingName,
    this.departure,
    this.arrivalCountry,
    this.tourDateStart,
    this.tourDateStop,
    this.numberOfNights,
    this.room,
    this.nutrition,
    this.tourPrice,
    this.fuelCharge,
    this.serviceCharge,
  });
}
