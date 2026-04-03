import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/helpers/dialog_helper/dialog_helper.dart';
import 'package:marketi/core/routing/routing_helper.dart';
import 'package:marketi/core/widgets/buttons/custom_text_button.dart';
import 'package:marketi/features/forgot_password/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:marketi/features/forgot_password/presentation/manager/forgot_password_cubit/forgot_password_state.dart';
import 'package:marketi/features/otp/data/models/auth_otp/forgot_password_otp_reason.dart';

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
          final email = context.read<ForgotPasswordCubit>().formData.email;
          RoutingHelper.pushOtp(
            context,
            otpReason: ForgotPasswordOtpReason(email: email),
          );
        } else if (state is ForgotPasswordFailure) {
          DialogHelper.showErrorDialog(context, errorMessage: state.errMsg);
        }
      },
      builder: (context, state) {
        return CustomTextButton(
          width: double.infinity,
          text: 'Send Code',
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
