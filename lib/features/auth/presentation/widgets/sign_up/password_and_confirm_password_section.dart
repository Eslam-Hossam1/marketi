import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/widgets/text_form_fields/custom_password_form_field_with_title.dart';
import 'package:marketi/core/widgets/spacing/height_space.dart';
import 'package:marketi/core/utils/constants.dart';
import 'package:marketi/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';

class PasswordAndConfirmPasswordSection extends StatelessWidget {
  const PasswordAndConfirmPasswordSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();
    return Column(
      children: [
        CustomPasswordTextFormFieldWithTitle(
          onSaved: (value) => cubit.formData.password = value!.trim(),
          onChanged: (value) => cubit.formData.password = value.trim(),
        ),
        HeightSpace(height: Constants.authTextFormFieldsGap),
        CustomPasswordTextFormFieldWithTitle(
          title: "Confirm Password",
          hint: "Confirm your password",
          onSaved: (value) => cubit.formData.confirmPassword = value!.trim(),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please confirm your password';
            }
            if (value != cubit.formData.password) {
              return 'Passwords do not match';
            }
            return null;
          },
        ),
      ],
    );
  }
}
