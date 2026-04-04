import 'package:flutter/material.dart';
import 'profile_setting_item.dart';

class SubscriptionPaymentTile extends StatelessWidget {
  const SubscriptionPaymentTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProfileSettingItem(
      iconData: Icons.credit_card_outlined,
      title: 'Subscription & Payment',
    );
  }
}
