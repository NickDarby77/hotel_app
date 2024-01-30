part of 'book_bloc.dart';

@immutable
sealed class BookState {}

final class BookInitial extends BookState {}

final class BookLoading extends BookState {}

final class BookSuccess extends BookState {
  final BookModel bookModel;
  BookSuccess({required this.bookModel});
}

final class BookError extends BookState {
  final String errorText;
  BookError({required this.errorText});
}
