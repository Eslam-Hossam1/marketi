import 'package:flutter/material.dart';
import 'package:marketi/core/extensions/smart_scale_extension.dart';

import '../../../../../core/widgets/sliver_sticky_footer.dart';
import '../../../../../core/widgets/spacing/height_space.dart';
import '../../../../../core/widgets/spacing/sliver_height_space.dart';
import '../../../../../core/widgets/custom_back_button_with_title_header.dart';
import 'enter_otp_section.dart';
import 'resend_code/resend_button_builder.dart';
import 'verify_button.dart';

class OtpViewBody extends StatefulWidget {
  const OtpViewBody({super.key});

  @override
  State<OtpViewBody> createState() => _OtpViewBodyState();
}

class _OtpViewBodyState extends State<OtpViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  void enableAutoValidation() {
    setState(() {
      autovalidateMode = AutovalidateMode.always;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w(context)),
        child: CustomScrollView(
          slivers: [
            const SliverHeightSpace(height: 12),
            const SliverToBoxAdapter(
              child: CustomBackButtonWithTitleHeader(
                title: 'Verification Code',
              ),
            ),
            const SliverHeightSpace(height: 32),
            const EnterOtpSection(),
            const SliverHeightSpace(height: 32),

            SliverStickyFooter(
              children: [
                VerifyButton(
                  enableAutoValidation: enableAutoValidation,
                  formKey: formKey,
                ),
                const HeightSpace(height: 16),
                const ResendButtonBuilder(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
