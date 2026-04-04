import 'package:flutter/material.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/widgets/app_logo_image.dart';
import 'package:marketi/core/widgets/spacing/sliver_height_space.dart';
import 'package:marketi/features/auth/presentation/widgets/sign_up/sign_up_button_and_already_have_account_section.dart';
import 'package:marketi/features/auth/presentation/widgets/sign_up/sign_up_text_fields_section.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
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
            const SliverHeightSpace(height: 8),
            SliverToBoxAdapter(
              child: Center(child: AppLogoImage(width: 180.w(context))),
            ),
            const SliverHeightSpace(height: 12),
            const SignUpTextFieldsSection(),
            const SliverHeightSpace(height: 40),
            SignUpButtonAndAlreadyHaveAccountSection(
              formKey: formKey,
              enableAutoValidation: _enableAutoValidation,
            ),
          ],
        ),
      ),
    );
  }
}
