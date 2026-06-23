import 'package:flutter/material.dart';
import 'package:nexcart/core/extensions/responsive_extension.dart';
import 'package:nexcart/core/utils/assets.dart';

class ResetPasswordIllustration extends StatelessWidget {
  const ResetPasswordIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        Assets.imagesPngIllustrationCreateNewPassword,
        width: 250.w(context),
      ),
    );
  }
}
