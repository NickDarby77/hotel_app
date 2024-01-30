import 'package:flutter/material.dart';

class EmailFieldWidget extends StatefulWidget {
  const EmailFieldWidget({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  State<EmailFieldWidget> createState() => _EmailFieldWidgetState();
}

class _EmailFieldWidgetState extends State<EmailFieldWidget> {
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) {
            setState(() {
              if (value.contains('@') ||
                  value.contains('.com') ||
                  value.isEmpty) {
                errorText = null;
              } else {
                errorText = 'Please enter a valid email address';
              }
            });
          },
          controller: widget.controller,
          decoration: InputDecoration(
            fillColor: const Color(0xffF6F6F9),
            filled: true,
            errorText: errorText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            label: const Text('Почта'),
            hintText: 'examplemail.000@mail.ru',
            hintStyle: const TextStyle(
              color: Color(0xFF14132A),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            contentPadding: const EdgeInsets.all(16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
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
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: const Color(0xffEB5757).withOpacity(0.15),
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: const Color(0xffEB5757).withOpacity(0.15),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
