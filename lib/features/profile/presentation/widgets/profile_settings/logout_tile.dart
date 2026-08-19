import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/profile_cubit/profile_cubit.dart';
import 'package:nextcart/core/helpers/dialog_helper/dialog_helper.dart';
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
        DialogHelper.showWarningDialog(
          context,
          errorMessage: 'Are you sure you want to log out?',
          btnOkText: 'Log Out',
          btnOkOnPress: () {
            if (context.mounted) {
              context.read<ProfileCubit>().logout();
            }
          },
        );
      },
    );
  }
}
