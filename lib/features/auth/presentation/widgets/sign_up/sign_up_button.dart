import 'package:flutter/material.dart';
import 'package:marketi/core/widgets/buttons/custom_text_button.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      width: double.infinity,
      text: 'Sign Up',
      onPressed: () {},
    );
  }
}
