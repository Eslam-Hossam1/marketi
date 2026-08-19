import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextcart/core/helpers/dialog_helper/dialog_helper.dart';
import 'package:nextcart/core/widgets/buttons/custom_text_button.dart';
import 'package:nextcart/features/forgot_password/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:nextcart/features/forgot_password/presentation/manager/forgot_password_cubit/forgot_password_state.dart';

class ForgotPasswordButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final void Function() enableAutoValidation;

  const ForgotPasswordButton({
    super.key,
    required this.formKey,
    required this.enableAutoValidation,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state is ForgotPasswordSuccess) {
          DialogHelper.showSuccessDialog(
            context,
            message:
                'We sent a password reset link to your email. Please check your inbox and tap the link to continue.',
          );
        } else if (state is ForgotPasswordFailure) {
          DialogHelper.showErrorDialog(context, errorMessage: state.errMsg);
        }
      },
      builder: (context, state) {
        return CustomTextButton(
          width: double.infinity,
          text: 'Send Reset Link',
          isLoading: state is ForgotPasswordLoading,
          onPressed: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              context.read<ForgotPasswordCubit>().sendCode();
            } else {
              enableAutoValidation();
            }
          },
        );
      },
    );
  }
}

