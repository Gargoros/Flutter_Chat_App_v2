import 'package:flutter/material.dart';

import '../../constants/colors_constants.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const CustomButton(
      {super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: tabColor,
          minimumSize: const Size(double.infinity, 50)),
      child: Text(
        buttonText,
        style: const TextStyle(
          color: customButtonColor,
        ),
      ),
    );
  }
}
