import 'package:flutter/material.dart';
import 'package:marketi/core/widgets/buttons/custom_text_button.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      width: double.infinity,
      text: 'Login',
      onPressed: () {},
    );
  }
}
