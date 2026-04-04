import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/routing/routing_helper.dart';
import 'package:marketi/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';

import 'profile_setting_item.dart';

class AccountPreferencesTile extends StatelessWidget {
  const AccountPreferencesTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileSettingItem(
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
    );
  }
}
