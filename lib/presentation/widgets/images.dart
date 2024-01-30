import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/presentation/blocs/hotel/hotel_bloc.dart';

class ImagesWidget extends StatefulWidget {
  const ImagesWidget({
    super.key,
    required this.itemCount,
    required this.generateLength,
    required this.itemBuilder,
  });

  final int itemCount;
  final int generateLength;
  final Widget Function(BuildContext, int, int)? itemBuilder;

  @override
  State<ImagesWidget> createState() => _ImagesWidgetState();
}

CarouselController carouselController = CarouselController();
int currentIndex = 0;

class _ImagesWidgetState extends State<ImagesWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelBloc, HotelState>(
      builder: (context, state) {
        if (state is HotelSuccess) {
          return Stack(
            children: [
              AspectRatio(
                aspectRatio: 343 / 257,
                child: CarouselSlider.builder(
                  carouselController: carouselController,
                  itemCount: widget.itemCount,
                  itemBuilder: widget.itemBuilder,
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    height: double.maxFinite,
                    viewportFraction: 1,
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(
                      widget.generateLength,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 7,
                        ),
                        child: InkWell(
                          onTap: () {
                            carouselController.animateToPage(
                              index,
                              duration: const Duration(
                                milliseconds: 300,
                              ),
                              curve: Curves.easeIn,
                            );
                          },
                          child: CircleAvatar(
                            radius: 5,
                            backgroundColor: currentIndex == index
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}
