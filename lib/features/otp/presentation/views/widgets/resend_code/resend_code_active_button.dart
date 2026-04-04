import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/theme/theme_colors_extension.dart';
import '../../../manager/otp_cubit/otp_cubit.dart';

class ResendCodeActiveButton extends StatelessWidget {
  const ResendCodeActiveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<OtpCubit>().sendVerificationCode();
      },
      child: Text(
        'Resend code via email',
        style: AppTextStyles.medium14(context).copyWith(
          color: context.primaryColor,
        ),
      ),
    );
  }
}
