import 'package:flutter/material.dart';
import 'package:hotel_app/presentation/screens/hotel_page.dart';
import 'package:hotel_app/presentation/widgets/custom_button.dart';
import 'package:hotel_app/resources/resources.dart';

class PaymentConfirmationPage extends StatelessWidget {
  const PaymentConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        scrolledUnderElevation: 0,
        title: const Text(
          'Заказ оплачен',
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 56),
          child: Column(
            children: [
              const SizedBox(height: 160),
              Image.asset(
                AppImages.pooperCelebrate,
              ),
              const SizedBox(height: 32),
              const Text(
                'Ваш заказ принят в работу',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 22),
              const Text(
                'Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF828796),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              CustomButtonWidget(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HotelPage(),
                      ),
                      (route) => false);
                },
                text: 'Супер!',
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
