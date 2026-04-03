import 'package:flutter/material.dart';
import 'package:marketi/core/extensions/smart_scale_extension.dart';
import 'package:marketi/core/widgets/app_logo_image.dart';
import 'package:marketi/core/widgets/spacing/sliver_height_space.dart';
import 'package:marketi/features/auth/presentation/widgets/login/login_button_and_dont_have_account_section.dart';
import 'package:marketi/features/auth/presentation/widgets/login/login_text_fields_section.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
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
              child: Center(child: AppLogoImage(width: 272.w(context))),
            ),
            const SliverHeightSpace(height: 32),
            const LoginTextFieldsSection(),
            const SliverHeightSpace(height: 40),
            LoginButtonAndDontHaveAccountSection(
              formKey: formKey,
              enableAutoValidation: _enableAutoValidation,
            ),
          ],
        ),
      ),
    );
  }
}
