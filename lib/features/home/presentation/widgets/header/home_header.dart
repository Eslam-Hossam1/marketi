import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextcart/core/theme/app_text_styles.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';
import 'package:nextcart/core/widgets/avatar/global_profile_avatar.dart';
import 'package:nextcart/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:nextcart/features/profile/presentation/manager/profile_cubit/profile_state.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          const GlobalProfileAvatar(baseSize: 48),
          const SizedBox(width: 12),
          BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              final userProfile = context.read<ProfileCubit>().userProfile;
              final name = userProfile != null && userProfile.name.isNotEmpty
                  ? userProfile.name.split(' ').first
                  : 'User';
                  
              return Text(
                "Hi $name !",
                style: AppTextStyles.bold20(
                  context,
                ).copyWith(color: context.mainTextColor),
              );
            },
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none_outlined,
              color: context.primaryColor,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
