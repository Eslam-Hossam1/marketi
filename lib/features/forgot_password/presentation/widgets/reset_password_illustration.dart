import 'package:flutter/material.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/utils/assets.dart';

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
