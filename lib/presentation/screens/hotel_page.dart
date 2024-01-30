import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/presentation/blocs/hotel/hotel_bloc.dart';
import 'package:hotel_app/presentation/screens/room_page.dart';
import 'package:hotel_app/presentation/widgets/custom_button.dart';
import 'package:hotel_app/presentation/widgets/images.dart';
import 'package:hotel_app/presentation/widgets/necessary_perks.dart';
import 'package:hotel_app/presentation/widgets/peculiarity_chip.dart';
import 'package:hotel_app/presentation/widgets/rating_text.dart';
import 'package:hotel_app/resources/resources.dart';

class HotelPage extends StatefulWidget {
  const HotelPage({super.key});

  @override
  State<HotelPage> createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
  @override
  void initState() {
    BlocProvider.of<HotelBloc>(context).add(
      GetHotelEvent(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        scrolledUnderElevation: 0,
        title: const Text(
          'Отель',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ),
      body: BlocBuilder<HotelBloc, HotelState>(
        builder: (context, state) {
          if (state is HotelSuccess) {
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
                      itemCount: state.hotelModel.imageUrls?.length ?? 0,
                      generateLength: state.hotelModel.imageUrls?.length ?? 0,
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
                              state.hotelModel.imageUrls![index],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    RatingTextWidget(
                      ratingText:
                          '${state.hotelModel.rating.toString()}  ${state.hotelModel.ratingName ?? ''}',
                    ),
                    const SizedBox(height: 8),
                    Text(
                      state.hotelModel.name ?? '',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      state.hotelModel.adress ?? '',
                      style: const TextStyle(
                        color: Color(0xFF0D72FF),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text:
                                'от ${state.hotelModel.minimalPrice.toString()} ₽ ',
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: state.hotelModel.priceForIt,
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
                    const Text(
                      'Об отеле',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      children: [
                        PeculiarityWidget(
                          text: state.hotelModel.aboutTheHotel?.peculiarities
                                  ?.first ??
                              '',
                        ),
                        PeculiarityWidget(
                          text: state.hotelModel.aboutTheHotel
                                  ?.peculiarities?[1] ??
                              '',
                        ),
                        PeculiarityWidget(
                          text: state.hotelModel.aboutTheHotel
                                  ?.peculiarities?[2] ??
                              '',
                        ),
                        PeculiarityWidget(
                          text: state.hotelModel.aboutTheHotel?.peculiarities
                                  ?.last ??
                              '',
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      state.hotelModel.aboutTheHotel?.description ?? '',
                      style: TextStyle(
                        color: Colors.black.withOpacity(
                          0.8999999761581421,
                        ),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: const Color(0xffFBFBFC),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Column(
                        children: [
                          NecessaryPerksWidget(
                            svgPath: AppSvgs.emojiHappy,
                            text: 'Удобства',
                          ),
                          Divider(
                            color: Color(0x26828796),
                            indent: 36,
                          ),
                          NecessaryPerksWidget(
                            svgPath: AppSvgs.tickSquare,
                            text: 'Что включено',
                          ),
                          Divider(
                            color: Color(0x26828796),
                            indent: 36,
                          ),
                          NecessaryPerksWidget(
                            svgPath: AppSvgs.closeSquare,
                            text: 'Что не включено',
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
                            builder: (context) => const RoomPage(),
                          ),
                        );
                      },
                      text: 'К выбору номера',
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            );
          } else if (state is HotelLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is HotelError) {
            // throw Exception();
            return Text(state.errorText);
          }
          return const SizedBox();
        },
      ),
    );
  }
}
