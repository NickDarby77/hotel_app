import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_app/resources/resources.dart';

class MoreAboutRoom extends StatelessWidget {
  const MoreAboutRoom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width / 1.9,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(
          13,
          114,
          255,
          0.10,
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
            const Text(
              'Подробнее о номере',
              style: TextStyle(
                color: Color(0xFF0D72FF),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            SvgPicture.asset(
              AppSvgs.arrowForward,
            ),
          ],
        ),
      ),
    );
  }
}
