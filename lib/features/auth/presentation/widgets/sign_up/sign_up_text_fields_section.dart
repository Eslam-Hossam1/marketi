import 'package:flutter/material.dart';
import 'package:marketi/core/utils/assets.dart';
import 'package:marketi/core/utils/constants.dart';
import 'package:marketi/core/utils/form_validators.dart';
import 'package:marketi/core/widgets/spacing/height_space.dart';
import 'package:marketi/core/widgets/text_form_fields/custom_text_form_field_with_title.dart';
import 'package:marketi/features/auth/presentation/widgets/sign_up/password_and_confirm_password_section.dart';

class SignUpTextFieldsSection extends StatelessWidget {
  const SignUpTextFieldsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          CustomTextFormFieldWithTitle(
            title: "Name",
            hint: "Full Name",
            prefixSvgPath: Assets.imagesSvgUserIcon,
          ),
          HeightSpace(height: Constants.authTextFormFieldsGap),
          CustomTextFormFieldWithTitle(
            title: "Phone",
            hint: "Enter your phone number",
            prefixSvgPath: Assets.imagesSvgPhoneIcon,
            keyboardType: TextInputType.phone,
          ),
          HeightSpace(height: Constants.authTextFormFieldsGap),
          CustomTextFormFieldWithTitle(
            title: "Email",
            hint: "Enter your email",
            prefixSvgPath: Assets.imagesSvgEmailIcon,
            validator: FormValidators.emailValidator,
          ),
          HeightSpace(height: Constants.authTextFormFieldsGap),
          PasswordAndConfirmPasswordSection(),
        ],
      ),
    );
  }
}
