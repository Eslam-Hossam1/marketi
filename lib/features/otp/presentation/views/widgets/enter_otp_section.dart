import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/extensions/smart_scale_extension.dart';
import 'package:marketi/core/utils/assets.dart';
import 'package:marketi/core/widgets/text_form_fields/custom_pin_code_field.dart';

import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/theme/theme_colors_extension.dart';
import '../../../../../core/widgets/spacing/height_space.dart';
import '../../manager/otp_cubit/otp_cubit.dart';

class EnterOtpSection extends StatelessWidget {
  const EnterOtpSection({super.key});

  @override
  Widget build(BuildContext context) {
    final otpCubit = context.read<OtpCubit>();
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            Assets.imagesPngIllustrationVerificationCodeWithEmail,
            width: 250.w(context),
          ),
          const HeightSpace(height: 32),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Please enter the 6 digit code\nsent to: ',
                  style: AppTextStyles.medium16(
                    context,
                  ).copyWith(color: context.secondaryTextColor, height: 1.5),
                ),
                TextSpan(
                  text: otpCubit.otpReason.email,
                  style: AppTextStyles.medium16(
                    context,
                  ).copyWith(color: context.primaryColor),
                ),
              ],
            ),
          ),
          const HeightSpace(height: 32),
          CustomPinCodeField(
            onChanged: (pinCode) {
              otpCubit.pinCode = pinCode;
            },
            onSaved: (pinCode) {
              otpCubit.pinCode = pinCode!;
            },
          ),
        ],
      ),
    );
  }
}
