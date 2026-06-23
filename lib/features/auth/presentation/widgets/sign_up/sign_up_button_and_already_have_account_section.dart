import 'package:flutter/material.dart';
import 'package:nexcart/core/widgets/sliver_sticky_footer.dart';
import 'package:nexcart/core/widgets/spacing/height_space.dart';
import 'package:nexcart/features/auth/presentation/widgets/sign_up/already_have_an_account.dart';
import 'package:nexcart/features/auth/presentation/widgets/sign_up/sign_up_button.dart';

class SignUpButtonAndAlreadyHaveAccountSection extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final void Function() enableAutoValidation;

  const SignUpButtonAndAlreadyHaveAccountSection({
    super.key,
    required this.formKey,
    required this.enableAutoValidation,
  });

  @override
  Widget build(BuildContext context) {
    return SliverStickyFooter(
      children: [
        SignUpButton(
          formKey: formKey,
          enableAutoValidation: enableAutoValidation,
        ),
        const HeightSpace(height: 8),
        const AlreadyHaveAnAccount(),
      ],
    );
  }
}
