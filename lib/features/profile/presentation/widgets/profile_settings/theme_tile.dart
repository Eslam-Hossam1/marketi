import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/cubit/theme_cubit/theme_cubit.dart';
import 'package:marketi/core/routing/routing_helper.dart';
import 'package:marketi/core/theme/app_text_styles.dart';
import 'package:marketi/core/theme/app_theme_options.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';

import 'profile_setting_item.dart';

class ThemeTile extends StatelessWidget {
  const ThemeTile({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ThemeCubit>().state;
    final themeOption = AppThemeOptions.getThemeModeOptionFromThemeMode(themeMode);

    return ProfileSettingItem(
      iconData: Icons.dark_mode_outlined,
      title: 'Theme',
      trailing: Text(
        themeOption.name,
        style: AppTextStyles.regular16(context).copyWith(
          color: context.secondaryTextColor,
        ),
      ),
      onTap: () {
        RoutingHelper.pushThemeSelection(context);
      },
    );
  }
}
