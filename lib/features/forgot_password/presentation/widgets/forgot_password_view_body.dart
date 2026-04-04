import 'package:flutter/material.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/widgets/sliver_sticky_footer%20copy.dart';
import 'package:marketi/core/widgets/spacing/sliver_height_space.dart';
import 'package:marketi/core/widgets/custom_back_button_with_title_header.dart';
import 'package:marketi/features/forgot_password/presentation/widgets/forgot_password_button.dart';
import 'package:marketi/features/forgot_password/presentation/widgets/forgot_password_description_text.dart';
import 'package:marketi/features/forgot_password/presentation/widgets/forgot_password_illustration.dart';
import 'package:marketi/features/forgot_password/presentation/widgets/forgot_password_text_fields_section.dart';

class ForgotPasswordViewBody extends StatefulWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  State<ForgotPasswordViewBody> createState() => _ForgotPasswordViewBodyState();
}

class _ForgotPasswordViewBodyState extends State<ForgotPasswordViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  void _enableAutoValidation() {
    if (autovalidateMode == AutovalidateMode.disabled) {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w(context)),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: CustomScrollView(
          slivers: [
            const SliverHeightSpace(height: 12),
            const SliverToBoxAdapter(
              child: CustomBackButtonWithTitleHeader(title: 'Forgot Password'),
            ),
            const SliverHeightSpace(height: 32),
            const SliverToBoxAdapter(child: ForgotPasswordIllustration()),
            const SliverHeightSpace(height: 32),
            const SliverToBoxAdapter(child: ForgotPasswordDescriptionText()),
            const SliverHeightSpace(height: 24),
            const ForgotPasswordTextFieldsSection(),
            const SliverHeightSpace(height: 32),
            SliverStickyFooter(
              children: [
                ForgotPasswordButton(
                  formKey: formKey,
                  enableAutoValidation: _enableAutoValidation,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
