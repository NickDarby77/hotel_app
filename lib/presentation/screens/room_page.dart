import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/presentation/blocs/hotel/hotel_bloc.dart';
import 'package:hotel_app/presentation/blocs/rooms/rooms_bloc.dart';
import 'package:hotel_app/presentation/screens/booking_page.dart';
import 'package:hotel_app/presentation/widgets/custom_button.dart';
import 'package:hotel_app/presentation/widgets/images.dart';
import 'package:hotel_app/presentation/widgets/more_about_room.dart';
import 'package:hotel_app/presentation/widgets/peculiarity_chip.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({super.key});

  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  @override
  void initState() {
    BlocProvider.of<RoomsBloc>(context).add(
      GetRoomsEvent(),
    );

    BlocProvider.of<HotelBloc>(context).add(
      GetHotelEvent(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: BlocBuilder<HotelBloc, HotelState>(
          builder: (context, state) {
            if (state is HotelSuccess) {
              return AppBar(
                scrolledUnderElevation: 0,
                centerTitle: true,
                title: Text(
                  state.hotelModel.name ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                  ),
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
      body: BlocBuilder<RoomsBloc, RoomsState>(
        builder: (context, state) {
          if (state is RoomsSuccess) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    ImagesWidget(
                      itemCount:
                          state.roomsModel.rooms?.first.imageUrls?.length ?? 0,
                      generateLength:
                          state.roomsModel.rooms?.first.imageUrls?.length ?? 0,
                      itemBuilder: (context, index, realIndex) => Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 2,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            16,
                          ),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              state.roomsModel.rooms?.first.imageUrls?[index] ??
                                  '',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      state.roomsModel.rooms?.first.name ?? '',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      children: [
                        PeculiarityWidget(
                          text: state.roomsModel.rooms?.first.peculiarities
                                  ?.first ??
                              '',
                        ),
                        PeculiarityWidget(
                          text:
                              state.roomsModel.rooms?.first.peculiarities?[1] ??
                                  '',
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const MoreAboutRoom(),
                    const SizedBox(height: 16),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text:
                                '${state.roomsModel.rooms?.first.price ?? ''} ₽ ',
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: state.roomsModel.rooms?.first.pricePer ?? '',
                            style: const TextStyle(
                              color: Color(0xFF828796),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    CustomButtonWidget(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BookingPage(),
                          ),
                        );
                      },
                      text: 'Выбрать номер',
                    ),
                    const SizedBox(height: 32),
                    ImagesWidget(
                      itemCount:
                          state.roomsModel.rooms?[1].imageUrls?.length ?? 0,
                      generateLength:
                          state.roomsModel.rooms?[1].imageUrls?.length ?? 0,
                      itemBuilder: (context, index, realIndex) => Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 2,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            16,
                          ),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              state.roomsModel.rooms?[1].imageUrls?[index] ??
                                  '',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      state.roomsModel.rooms?[1].name ?? '',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      children: [
                        PeculiarityWidget(
                          text:
                              state.roomsModel.rooms?[1].peculiarities?.first ??
                                  '',
                        ),
                        PeculiarityWidget(
                          text: state.roomsModel.rooms?[1].peculiarities?[1] ??
                              '',
                        ),
                        PeculiarityWidget(
                          text:
                              state.roomsModel.rooms?[1].peculiarities?.last ??
                                  '',
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const MoreAboutRoom(),
                    const SizedBox(height: 16),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text:
                                '${state.roomsModel.rooms?[1].price ?? ''} ₽ ',
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: state.roomsModel.rooms?[1].pricePer ?? '',
                            style: const TextStyle(
                              color: Color(0xFF828796),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    CustomButtonWidget(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BookingPage(),
                          ),
                        );
                      },
                      text: 'Выбрать номер',
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            );
          } else if (state is RoomsLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is RoomsError) {
            // throw Exception();
            return Text(state.errorText);
          }
          return const SizedBox();
        },
      ),
    );
  }
}
