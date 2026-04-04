import '../../../../../core/routing/routes_paths.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/theme/theme_colors_extension.dart';
import '../../../../../../core/widgets/buttons/clickable_text.dart';
import 'package:flutter/material.dart';

class DontHaveAnEmail extends StatelessWidget {
  const DontHaveAnEmail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: AppTextStyles.medium14(context).copyWith(
            color: context.mainTextColor,
          ),
        ),
        ClickableText(
          text: 'Sign Up',
          style: AppTextStyles.bold14(context).copyWith(
            color: context.primaryColor,
          ),
          onTap: () => context.go(RoutePaths.signUp),
        ),
      ],
    );
  }
}
