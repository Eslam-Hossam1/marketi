import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/extensions/smart_scale_extension.dart';
import 'package:marketi/core/theme/app_text_styles.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => context.pop(),
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
        Stack(
          alignment: Alignment.topRight,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: context.primaryColor,
                size: 24.w(context),
              ),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
            Container(
              padding: EdgeInsets.all(4.w(context)),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: Text(
                '3',
                style: AppTextStyles.regular12(
                  context,
                ).copyWith(color: Colors.white, fontSize: 10),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
