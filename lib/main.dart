import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/core/services/dio/dio_settings.dart';
import 'package:hotel_app/data/repositories/book_repo.dart';
import 'package:hotel_app/data/repositories/hotel_repository.dart';
import 'package:hotel_app/data/repositories/room_repo.dart';
import 'package:hotel_app/presentation/blocs/book/book_bloc.dart';
import 'package:hotel_app/presentation/blocs/hotel/hotel_bloc.dart';
import 'package:hotel_app/presentation/blocs/rooms/rooms_bloc.dart';
import 'package:hotel_app/presentation/screens/hotel_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFieldUnfocus(
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => DioSettings(),
          ),
          RepositoryProvider(
            create: (context) => HotelRepository(
              dio: RepositoryProvider.of<DioSettings>(context).dio,
            ),
          ),
          RepositoryProvider(
            create: (context) => RoomRepository(
              dio: RepositoryProvider.of<DioSettings>(context).dio,
            ),
          ),
          RepositoryProvider(
            create: (context) => BookRepository(
              dio: RepositoryProvider.of<DioSettings>(context).dio,
            ),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => HotelBloc(
                repository: RepositoryProvider.of<HotelRepository>(
                  context,
                ),
              ),
            ),
            BlocProvider(
              create: (context) => RoomsBloc(
                repository: RepositoryProvider.of<RoomRepository>(
                  context,
                ),
              ),
            ),
            BlocProvider(
              create: (context) => BookBloc(
                repository: RepositoryProvider.of<BookRepository>(
                  context,
                ),
              ),
            ),
          ],
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HotelPage(),
          ),
        ),
      ),
    );
  }
}

class TextFieldUnfocus extends StatelessWidget {
  const TextFieldUnfocus({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          final FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            currentFocus.focusedChild!.unfocus();
          }
        },
        child: child,
      );
}
