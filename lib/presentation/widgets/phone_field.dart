import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneFieldWidget extends StatelessWidget {
  const PhoneFieldWidget({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      disableLengthCheck: true,
      showDropdownIcon: false,
      showCountryFlag: false,
      controller: controller,
      // dropdownIconPosition: IconPosition.trailing,
      // flagsButtonPadding: const EdgeInsets.only(left: 11),
      initialCountryCode: 'RU',
      decoration: InputDecoration(
        fillColor: const Color(0xffF6F6F9),
        filled: true,
        labelText: 'Номер телефона',
        hintText: '(***) ***-**-**',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.all(16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
