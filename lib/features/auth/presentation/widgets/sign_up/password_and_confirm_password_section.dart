import 'package:flutter/material.dart';
import 'package:marketi/core/utils/constants.dart';
import 'package:marketi/core/widgets/spacing/height_space.dart';
import 'package:marketi/core/widgets/text_form_fields/custom_password_form_field_with_title.dart';

class PasswordAndConfirmPasswordSection extends StatelessWidget {
  const PasswordAndConfirmPasswordSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomPasswordTextFormFieldWithTitle(),
        HeightSpace(height: Constants.authTextFormFieldsGap),
        CustomPasswordTextFormFieldWithTitle(
          title: "Confirm Password",
          hint: "Confirm your password",
        ),
      ],
    );
  }
}
