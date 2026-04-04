import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/routing/routing_helper.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:marketi/core/widgets/spacing/height_space.dart';
import 'package:marketi/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';

import 'profile_setting_item.dart';

class ProfileSettingsList extends StatefulWidget {
  const ProfileSettingsList({super.key});

  @override
  State<ProfileSettingsList> createState() => _ProfileSettingsListState();
}

class _ProfileSettingsListState extends State<ProfileSettingsList> {
  bool isNotificationsEnabled = true;
  bool isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileSettingItem(
          iconData: Icons.person_outline,
          title: 'Account Preferences',
          onTap: () async {
            final result = await RoutingHelper.pushEditProfile(
              context,
              userProfile: context.read<ProfileCubit>().userProfile!,
            );
            if (result == true && context.mounted) {
              context.read<ProfileCubit>().getUserData();
            }
          },
        ),
        Divider(color: context.outlineColor.withValues(alpha: 0.2)),
        const ProfileSettingItem(
          iconData: Icons.credit_card_outlined,
          title: 'Subscription & Payment',
        ),
        Divider(color: context.outlineColor.withValues(alpha: 0.2)),
        ProfileSettingItem(
          iconData: Icons.notifications_none_outlined,
          title: 'App Notifications',
          trailing: CupertinoSwitch(
            value: isNotificationsEnabled,
            activeColor: Colors.blueAccent,
            onChanged: (value) {
              setState(() {
                isNotificationsEnabled = value;
              });
            },
          ),
        ),
        Divider(color: context.outlineColor.withValues(alpha: 0.2)),
        ProfileSettingItem(
          iconData: Icons.dark_mode_outlined,
          title: 'Dark Mode',
          trailing: CupertinoSwitch(
            value: isDarkModeEnabled,
            activeColor: Colors.blueAccent,
            onChanged: (value) {
              setState(() {
                isDarkModeEnabled = value;
              });
            },
          ),
        ),
        Divider(color: context.outlineColor.withValues(alpha: 0.2)),
        const ProfileSettingItem(iconData: Icons.star_border, title: 'Rate Us'),
        Divider(color: context.outlineColor.withValues(alpha: 0.2)),
        const ProfileSettingItem(
          iconData: Icons.chat_bubble_outline,
          title: 'Provide Feedback',
        ),
        Divider(color: context.outlineColor.withValues(alpha: 0.2)),
        const ProfileSettingItem(
          iconData: Icons.logout,
          title: 'Log Out',
          iconColor: Colors.redAccent,
        ),
        const HeightSpace(height: 32),
      ],
    );
  }
}
