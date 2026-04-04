import 'package:flutter/material.dart';
import 'profile_setting_item.dart';

class ProvideFeedbackTile extends StatelessWidget {
  const ProvideFeedbackTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProfileSettingItem(
      iconData: Icons.chat_bubble_outline,
      title: 'Provide Feedback',
    );
  }
}
