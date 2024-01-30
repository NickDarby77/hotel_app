import 'package:flutter/material.dart';
import 'package:hotel_app/presentation/widgets/tourist_field.dart';

class ExpansionFormWidget extends StatelessWidget {
  const ExpansionFormWidget({
    super.key,
    required this.isExpanded,
    required this.touristOrder,
    this.trailing,
  });

  final bool isExpanded;
  final String touristOrder;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      controller: ExpansionTileController(),
      collapsedIconColor: const Color(0xff0D72FF),
      iconColor: const Color(0xff0D72FF),
      initiallyExpanded: isExpanded,
      trailing: trailing,
      title: Text(
        touristOrder,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
      ),
      children: [
        TouristFieldWidget(
          controller: TextEditingController(),
          labelText: 'Имя',
        ),
        TouristFieldWidget(
          controller: TextEditingController(),
          labelText: 'Фамилия',
        ),
        TouristFieldWidget(
          controller: TextEditingController(),
          labelText: 'Дата рождения',
        ),
        TouristFieldWidget(
          controller: TextEditingController(),
          labelText: 'Гражданство',
        ),
        TouristFieldWidget(
          controller: TextEditingController(),
          labelText: 'Номер загранпаспорта',
        ),
        TouristFieldWidget(
          controller: TextEditingController(),
          labelText: 'Номер загранпаспорта',
        ),
        TouristFieldWidget(
          controller: TextEditingController(),
          labelText: 'Срок действия загранпаспорта',
        ),
      ],
    );
  }
}
