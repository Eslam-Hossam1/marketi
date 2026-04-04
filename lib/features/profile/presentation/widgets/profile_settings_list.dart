import 'package:flutter/material.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:marketi/core/widgets/spacing/height_space.dart';

import 'profile_settings/account_preferences_tile.dart';
import 'profile_settings/app_notifications_tile.dart';
import 'profile_settings/logout_tile.dart';
import 'profile_settings/provide_feedback_tile.dart';
import 'profile_settings/rate_us_tile.dart';
import 'profile_settings/subscription_payment_tile.dart';
import 'profile_settings/theme_tile.dart';

class ProfileSettingsList extends StatelessWidget {
  const ProfileSettingsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AccountPreferencesTile(),
        Divider(color: context.outlineColor.withValues(alpha: 0.2)),
        const SubscriptionPaymentTile(),
        Divider(color: context.outlineColor.withValues(alpha: 0.2)),
        const AppNotificationsTile(),
        Divider(color: context.outlineColor.withValues(alpha: 0.2)),
        const ThemeTile(),
        Divider(color: context.outlineColor.withValues(alpha: 0.2)),
        const RateUsTile(),
        Divider(color: context.outlineColor.withValues(alpha: 0.2)),
        const ProvideFeedbackTile(),
        Divider(color: context.outlineColor.withValues(alpha: 0.2)),
        const LogOutTile(),
        const HeightSpace(height: 32),
      ],
    );
  }
}
