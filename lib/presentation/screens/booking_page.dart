import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_app/presentation/blocs/book/book_bloc.dart';
import 'package:hotel_app/presentation/screens/payment_confirmation_page.dart';
import 'package:hotel_app/presentation/widgets/booking_details.dart';
import 'package:hotel_app/presentation/widgets/custom_button.dart';
import 'package:hotel_app/presentation/widgets/email_field.dart';
import 'package:hotel_app/presentation/widgets/final_price.dart';
import 'package:hotel_app/presentation/widgets/phone_field.dart';
import 'package:hotel_app/presentation/widgets/rating_text.dart';
import 'package:hotel_app/presentation/widgets/expansion_tourist_form.dart';
import 'package:hotel_app/resources/resources.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  void initState() {
    BlocProvider.of<BookBloc>(context).add(
      GetBookEvent(),
    );
    super.initState();
  }

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        scrolledUnderElevation: 0,
        title: const Text(
          'Бронирование',
          style: TextStyle(
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
      ),
      body: BlocBuilder<BookBloc, BookState>(
        builder: (context, state) {
          if (state is BookSuccess) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    RatingTextWidget(
                      ratingText:
                          '${state.bookModel.horating}  ${state.bookModel.ratingName}',
                    ),
                    const SizedBox(height: 8),
                    Text(
                      state.bookModel.hotelName ?? '',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      state.bookModel.hotelAdress ?? '',
                      style: const TextStyle(
                        color: Color(0xFF0D72FF),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),
                    BookingDetailsWidget(
                      text: 'Вылет из',
                      text2: state.bookModel.departure ?? '',
                    ),
                    BookingDetailsWidget(
                      text: 'Страна, город',
                      text2: state.bookModel.arrivalCountry ?? '',
                    ),
                    BookingDetailsWidget(
                      text: 'Даты',
                      text2:
                          '${state.bookModel.tourDateStart ?? ''} - ${state.bookModel.tourDateStop ?? ''}',
                    ),
                    BookingDetailsWidget(
                      text: 'Кол-во ночей',
                      text2:
                          '${state.bookModel.numberOfNights.toString()} ночей',
                    ),
                    BookingDetailsWidget(
                      text: 'Отель',
                      text2: state.bookModel.hotelName ?? '',
                    ),
                    BookingDetailsWidget(
                      text: 'Номер',
                      text2: state.bookModel.room ?? '',
                    ),
                    BookingDetailsWidget(
                      text: 'Питание',
                      text2: state.bookModel.nutrition ?? '',
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Информация о покупателе',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 20),
                    PhoneFieldWidget(controller: phoneController),
                    const SizedBox(height: 16),
                    EmailFieldWidget(controller: emailController),
                    const SizedBox(height: 8),
                    const Text(
                      'Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту',
                      style: TextStyle(
                        color: Color(0xFF828796),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const ExpansionFormWidget(
                      isExpanded: true,
                      touristOrder: 'Первый турист',
                    ),
                    const ExpansionFormWidget(
                      isExpanded: false,
                      touristOrder: 'Второй турист ',
                    ),
                    ExpansionFormWidget(
                      isExpanded: false,
                      touristOrder: 'Добавить туриста ',
                      trailing: SvgPicture.asset(
                        AppSvgs.addForm,
                      ),
                    ),
                    const SizedBox(height: 16),
                    FinalPriceWidget(
                      text: 'Тур',
                      text2: '${state.bookModel.tourPrice.toString()} ₽',
                    ),
                    FinalPriceWidget(
                      text: 'Топливный сбор',
                      text2: '${state.bookModel.fuelCharge.toString()} ₽',
                    ),
                    FinalPriceWidget(
                      text: 'Сервисный сбор',
                      text2: '${state.bookModel.serviceCharge.toString()} ₽',
                    ),
                    // ignore: prefer_interpolation_to_compose_strings
                    const FinalPriceWidget(
                      text: 'К оплате',
                      text2: '',
                      text3: '300 850 ₽',
                    ),
                    const SizedBox(height: 16),
                    CustomButtonWidget(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const PaymentConfirmationPage(),
                          ),
                        );
                      },
                      text: 'Оплатить 300 850 ₽',
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            );
          } else if (state is BookLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is BookError) {
            // throw Exception();
            return Text(state.errorText);
          }
          return const SizedBox();
        },
      ),
    );
  }
}
