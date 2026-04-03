import 'package:flutter/material.dart';
import 'package:marketi/core/extensions/smart_scale_extension.dart';
import 'package:marketi/core/widgets/spacing/sliver_height_space.dart';
import 'package:marketi/core/widgets/custom_back_button_with_title_header.dart';
import 'package:marketi/features/forgot_password/presentation/widgets/reset_password_button.dart';
import 'package:marketi/features/forgot_password/presentation/widgets/reset_password_description_text.dart';
import 'package:marketi/features/forgot_password/presentation/widgets/reset_password_illustration.dart';
import 'package:marketi/features/forgot_password/presentation/widgets/reset_password_text_fields_section.dart';

class ResetPasswordViewBody extends StatefulWidget {
  const ResetPasswordViewBody({super.key});

  @override
  State<ResetPasswordViewBody> createState() => _ResetPasswordViewBodyState();
}

class _ResetPasswordViewBodyState extends State<ResetPasswordViewBody> {
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
              child: CustomBackButtonWithTitleHeader(
                title: 'Create New Password',
              ),
            ),
            const SliverHeightSpace(height: 32),
            const SliverToBoxAdapter(child: ResetPasswordIllustration()),
            const SliverHeightSpace(height: 32),
            const SliverToBoxAdapter(child: ResetPasswordDescriptionText()),
            const SliverHeightSpace(height: 24),
            const ResetPasswordTextFieldsSection(),
            const SliverHeightSpace(height: 32),
            SliverToBoxAdapter(
              child: ResetPasswordButton(
                formKey: formKey,
                enableAutoValidation: _enableAutoValidation,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
