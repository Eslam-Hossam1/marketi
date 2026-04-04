import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/theme/app_text_styles.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:marketi/core/widgets/spacing/width_space.dart';

class ProfileSettingItem extends StatelessWidget {
  final IconData? iconData;
  final String? svgIcon;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? iconColor;

  const ProfileSettingItem({
    super.key,
    this.iconData,
    this.svgIcon,
    required this.title,
    this.trailing,
    this.onTap,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.w(context)),
        child: Row(
          children: [
            if (svgIcon != null)
              SvgPicture.asset(
                svgIcon!,
                width: 24.w(context),
                colorFilter: ColorFilter.mode(
                  iconColor ?? context.mainTextColor,
                  BlendMode.srcIn,
                ),
              )
            else if (iconData != null)
              Icon(
                iconData,
                size: 24.w(context),
                color: iconColor ?? context.mainTextColor,
              ),
            const WidthSpace(width: 16),
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.semiBold16(
                  context,
                ).copyWith(color: context.mainTextColor),
              ),
            ),
            if (trailing != null)
              trailing!
            else
              Icon(
                Icons.arrow_forward_ios,
                size: 16.w(context),
                color: context.outlineColor.withValues(alpha: 0.5),
              ),
          ],
        ),
      ),
    );
  }
}
