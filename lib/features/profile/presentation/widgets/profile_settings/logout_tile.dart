import 'package:flutter/material.dart';
import 'profile_setting_item.dart';

class LogOutTile extends StatelessWidget {
  const LogOutTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProfileSettingItem(
      iconData: Icons.logout,
      title: 'Log Out',
      iconColor: Colors.redAccent,
    );
  }
}
