import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/utils/assets.dart';
import 'package:marketi/core/utils/constants.dart';
import 'package:marketi/core/utils/form_validators.dart';
import 'package:marketi/core/widgets/spacing/height_space.dart';
import 'package:marketi/core/widgets/text_form_fields/custom_password_form_field_with_title.dart';
import 'package:marketi/core/widgets/text_form_fields/custom_text_form_field_with_title.dart';
import 'package:marketi/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:marketi/features/auth/presentation/widgets/login/forgot_password_clickable_text.dart';

class LoginTextFieldsSection extends StatelessWidget {
  const LoginTextFieldsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return SliverToBoxAdapter(
      child: Column(
        children: [
          CustomTextFormFieldWithTitle(
            title: "Email",
            hint: "Enter your email",
            prefixSvgPath: Assets.imagesSvgEmailIcon,
            validator: FormValidators.emailValidator,
            onSaved: (value) => cubit.formData.email = value!.trim(),
          ),
          HeightSpace(height: Constants.authTextFormFieldsGap),
          CustomPasswordTextFormFieldWithTitle(
            onSaved: (value) => cubit.formData.password = value!.trim(),
          ),
          const HeightSpace(height: 10),
          const ForgotPasswordClickableText(),
        ],
      ),
    );
  }
}
