import 'package:marketi/core/theme/app_text_styles.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:flutter/material.dart';

class SettingTile extends StatelessWidget {
  final String title;
  final String value;
  final VoidCallback onTap;
  final IconData icon;
  const SettingTile({
    super.key,
    required this.title,
    required this.value,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ListTile(
        leading: Icon(icon, color: context.mainTextColor),
        title: Text(
          title,
          style: AppTextStyles.medium16(
            context,
          ).copyWith(color: context.mainTextColor),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              value,
              style: AppTextStyles.medium12(
                context,
              ).copyWith(color: context.secondaryTextColor),
            ),
            SizedBox(width: 8),
            const Icon(Icons.arrow_forward_ios_rounded, size: 18),
          ],
        ),
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }
}
