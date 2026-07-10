import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/profile_cubit/profile_cubit.dart';
import 'profile_setting_item.dart';

class LogOutTile extends StatelessWidget {
  const LogOutTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileSettingItem(
      iconData: Icons.logout,
      title: 'Log Out',
      iconColor: Colors.redAccent,
      onTap: () {
        context.read<ProfileCubit>().logout();
      },
    );
  }
}
