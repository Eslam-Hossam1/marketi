import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/utils/assets.dart';
import 'package:marketi/core/utils/form_validators.dart';
import 'package:marketi/core/widgets/text_form_fields/custom_text_form_field_with_title.dart';
import 'package:marketi/features/forgot_password/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';

class ForgotPasswordTextFieldsSection extends StatelessWidget {
  const ForgotPasswordTextFieldsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgotPasswordCubit>();
    return SliverToBoxAdapter(
      child: CustomTextFormFieldWithTitle(
        title: "Email",
        hint: "You@gmail.com",
        prefixSvgPath: Assets.imagesSvgEmailIcon,
        validator: FormValidators.emailValidator,
        onSaved: (value) => cubit.formData.email = value!.trim(),
      ),
    );
  }
}
