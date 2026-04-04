import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/utils/constants.dart';
import 'package:marketi/core/utils/form_validators.dart';
import 'package:marketi/core/widgets/spacing/height_space.dart';
import 'package:marketi/core/widgets/text_form_fields/custom_password_form_field_with_title.dart';
import 'package:marketi/features/forgot_password/presentation/manager/reset_password_cubit/reset_password_cubit.dart';

class ResetPasswordTextFieldsSection extends StatelessWidget {
  const ResetPasswordTextFieldsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ResetPasswordCubit>();
    return SliverToBoxAdapter(
      child: Column(
        children: [
          CustomPasswordTextFormFieldWithTitle(
            title: "Password",
            onSaved: (value) => cubit.formData.password = value!.trim(),
          ),
          HeightSpace(height: Constants.authTextFormFieldsGap),
          CustomPasswordTextFormFieldWithTitle(
            title: "Confirm Password",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              if (value != cubit.formData.password) {
                return 'Passwords do not match';
              }
              return FormValidators.passwordValidator(value);
            },
            onChanged: (value) => cubit.formData.confirmPassword = value.trim(),
            onSaved: (value) => cubit.formData.confirmPassword = value!.trim(),
          ),
        ],
      ),
    );
  }
}
