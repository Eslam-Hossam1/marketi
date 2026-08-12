import 'package:flutter/material.dart';
import 'package:nextcart/core/routing/routing_helper.dart';
import 'profile_setting_item.dart';

class SubscriptionPaymentTile extends StatelessWidget {
  const SubscriptionPaymentTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileSettingItem(
      iconData: Icons.shopping_bag_outlined,
      title: 'My Orders',
      onTap: () => RoutingHelper.pushOrders(context),
    );
  }
}
