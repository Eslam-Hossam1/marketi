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
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w(context)),
      child: Form(
        key: formKey,
        autovalidateMode: autoValidateMode,
        child: CustomScrollView(
          slivers: [
            SliverHeightSpace(height: 8),
            SliverToBoxAdapter(
              child: Center(child: AppLogoImage(width: 272.w(context))),
            ),
            SliverHeightSpace(height: 32),
            LoginTextFieldsSection(),
            SliverHeightSpace(height: 40),
            LoginButtonAndDontHaveAccountSection(),
          ],
        ),
      ),
    );
  }
}
