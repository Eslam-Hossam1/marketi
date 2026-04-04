import 'package:flutter/material.dart';
import 'package:marketi/core/widgets/sliver_sticky_footer.dart';
import 'package:marketi/core/widgets/spacing/height_space.dart';
import 'package:marketi/features/auth/presentation/widgets/login/dont_have_an_email.dart';
import 'package:marketi/features/auth/presentation/widgets/login/login_button.dart';

class LoginButtonAndDontHaveAccountSection extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final void Function() enableAutoValidation;

  const LoginButtonAndDontHaveAccountSection({
    super.key,
    required this.formKey,
    required this.enableAutoValidation,
  });

  @override
  Widget build(BuildContext context) {
    return SliverStickyFooter(
      children: [
        LoginButton(
          formKey: formKey,
          enableAutoValidation: enableAutoValidation,
        ),
        const HeightSpace(height: 8),
        const DontHaveAnEmail(),
      ],
    );
  }
}
