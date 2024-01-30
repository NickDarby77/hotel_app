import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NecessaryPerksWidget extends StatelessWidget {
  const NecessaryPerksWidget({
    super.key,
    required this.svgPath,
    required this.text,
  });

  final String svgPath;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          svgPath,
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: const TextStyle(
                color: Color(0xFF2C3035),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Text(
              'Самое необходимое',
              style: TextStyle(
                color: Color(0xFF828696),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const Spacer(),
        const Icon(
          Icons.arrow_forward_ios,
        ),
      ],
    );
  }
}
