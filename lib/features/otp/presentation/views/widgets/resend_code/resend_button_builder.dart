import 'resend_button_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../manager/otp_cubit/otp_cubit.dart';
import 'resend_code_active_button.dart';
import 'resend_code_with_timer.dart';

class ResendButtonBuilder extends StatelessWidget {
  const ResendButtonBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OtpCubit, OtpState>(
      buildWhen: (previous, current) =>
          current is OtpInitial ||
          current is OtpShowResendButton ||
          current is SendOtpSuccess,
      builder: (context, state) {
        if (state is OtpInitial) {
          return const ResendButtonPlaceholder();
        } else if (state is OtpShowResendButton) {
          return const ResendCodeActiveButton();
        } else {
          return const ResendCodeWithTimer();
        }
      },
    );
  }
}
