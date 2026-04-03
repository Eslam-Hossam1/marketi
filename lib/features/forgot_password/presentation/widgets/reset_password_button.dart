import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/helpers/dialog_helper/dialog_helper.dart';
import 'package:marketi/core/routing/routes_paths.dart';
import 'package:marketi/core/widgets/buttons/custom_text_button.dart';
import 'package:marketi/features/forgot_password/presentation/manager/reset_password_cubit/reset_password_cubit.dart';
import 'package:marketi/features/forgot_password/presentation/manager/reset_password_cubit/reset_password_state.dart';

class ResetPasswordButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final void Function() enableAutoValidation;

  const ResetPasswordButton({
    super.key,
    required this.formKey,
    required this.enableAutoValidation,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          DialogHelper.showSuccessDialog(context, message: 'Password reset successfully');
          context.go(RoutePaths.login);
        } else if (state is ResetPasswordFailure) {
          DialogHelper.showErrorDialog(context, errorMessage: state.errMsg);
        }
      },
      builder: (context, state) {
        return CustomTextButton(
          width: double.infinity,
          text: 'Save Password',
          isLoading: state is ResetPasswordLoading,
          onPressed: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              context.read<ResetPasswordCubit>().resetPassword();
            } else {
              enableAutoValidation();
            }
          },
        );
      },
    );
  }
}
