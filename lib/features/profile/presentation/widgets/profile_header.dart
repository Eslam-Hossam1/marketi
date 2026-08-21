import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nextcart/core/extensions/responsive_extension.dart';
import 'package:nextcart/core/routing/routes_paths.dart';
import 'package:nextcart/core/theme/app_text_styles.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';
import 'package:nextcart/core/widgets/buttons/cart_icon_button.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => context.go(RoutePaths.home),
          icon: Padding(
            padding: const EdgeInsets.all(12),
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 20.w(context),
              color: context.primaryColor,
            ),
          ),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          style: IconButton.styleFrom(
            shape: const CircleBorder(),
            side: BorderSide(
              color: context.primaryColor.withValues(alpha: 0.2),
            ),
          ),
        ),
        Text(
          'My Profile',
          style: AppTextStyles.bold20(
            context,
          ).copyWith(color: context.primaryColor),
        ),
        CartIconButton(),
      ],
    );
  }
}
