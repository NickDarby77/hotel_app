import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_app/resources/resources.dart';

class RatingTextWidget extends StatelessWidget {
  const RatingTextWidget({
    super.key,
    required this.ratingText,
  });

  final String ratingText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width / 2.4,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(
          255,
          199,
          0,
          0.20,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              AppSvgs.star,
            ),
            const SizedBox(width: 2),
            Text(
              ratingText,
              style: const TextStyle(
                color: Color(0xFFFFA800),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
