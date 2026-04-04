import 'package:flutter/material.dart';
import 'profile_setting_item.dart';

class RateUsTile extends StatelessWidget {
  const RateUsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProfileSettingItem(
      iconData: Icons.star_border,
      title: 'Rate Us',
    );
  }
}
