import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nextcart/core/routing/routes_paths.dart';
import 'package:nextcart/core/theme/app_text_styles.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';
import 'package:nextcart/core/widgets/buttons/clickable_text.dart';

class ForgotPasswordClickableText extends StatelessWidget {
  const ForgotPasswordClickableText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ClickableText(
        text: 'Forgot password?',
        style: AppTextStyles.medium12(
          context,
        ).copyWith(color: context.primaryColor),
        onTap: () => context.push(RoutePaths.forgotPassword),
      ),
    );
  }
}
