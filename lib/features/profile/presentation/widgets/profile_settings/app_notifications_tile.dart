import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'profile_setting_item.dart';

class AppNotificationsTile extends StatefulWidget {
  const AppNotificationsTile({super.key});

  @override
  State<AppNotificationsTile> createState() => _AppNotificationsTileState();
}

class _AppNotificationsTileState extends State<AppNotificationsTile> {
  bool isNotificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return ProfileSettingItem(
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
    );
  }
}
