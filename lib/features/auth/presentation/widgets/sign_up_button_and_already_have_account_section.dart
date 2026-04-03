import 'package:flutter/material.dart';
import 'package:marketi/core/widgets/sliver_sticky_footer.dart';
import 'package:marketi/core/widgets/spacing/height_space.dart';
import 'package:marketi/features/auth/presentation/widgets/sign_up/already_have_an_account.dart';
import 'package:marketi/features/auth/presentation/widgets/sign_up/sign_up_button.dart';

class SignUpButtonAndAlreadyHaveAccountSection extends StatelessWidget {
  const SignUpButtonAndAlreadyHaveAccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverStickyFooter(
      children: [
        SignUpButton(),
        HeightSpace(height: 8),
        AlreadyHaveAnAccount(),
      ],
    );
  }
}
