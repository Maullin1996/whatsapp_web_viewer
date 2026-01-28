import 'package:flutter/material.dart';

class CustomLoginTextFormField extends StatelessWidget {
  final TextEditingController textController;
  final TextInputType? keyboardType;
  final String labelText;
  final VoidCallback? onSubmit;
  final bool obscureText;

  const CustomLoginTextFormField({
    super.key,
    required this.textController,
    this.keyboardType,
    required this.labelText,
    this.obscureText = false,
    this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: const Color.fromARGB(96, 236, 248, 240),
        border: Border.all(
          color: const Color.fromARGB(255, 167, 231, 200),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextFormField(
        controller: textController,
        textInputAction: TextInputAction.done,
        keyboardType: keyboardType,
        onFieldSubmitted: (_) => onSubmit?.call(),
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: labelText,
          floatingLabelStyle: TextStyle(color: Colors.black),
        ),
        obscureText: obscureText,
      ),
    );
  }
}
