import 'package:flutter/material.dart';
import 'package:marketi/core/utils/assets.dart';
import 'package:marketi/core/utils/constants.dart';
import 'package:marketi/core/utils/form_validators.dart';
import 'package:marketi/core/widgets/spacing/height_space.dart';
import 'package:marketi/core/widgets/text_form_fields/custom_password_form_field_with_title.dart';
import 'package:marketi/core/widgets/text_form_fields/custom_text_form_field_with_title.dart';
import 'package:marketi/features/auth/presentation/widgets/login/forgot_password_clickable_text.dart';

class LoginTextFieldsSection extends StatelessWidget {
  const LoginTextFieldsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          CustomTextFormFieldWithTitle(
            title: "Email",
            hint: "Enter your email",
            prefixSvgPath: Assets.imagesSvgEmailIcon,
            validator: FormValidators.emailValidator,
          ),
          HeightSpace(height: Constants.authTextFormFieldsGap),
          CustomPasswordTextFormFieldWithTitle(),
          const HeightSpace(height: 10),
          const ForgotPasswordClickableText(),
        ],
      ),
    );
  }
}
