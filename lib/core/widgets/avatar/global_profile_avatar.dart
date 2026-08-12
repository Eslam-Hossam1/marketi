import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nextcart/core/routing/routes_paths.dart';
import 'package:nextcart/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:nextcart/features/profile/presentation/manager/profile_cubit/profile_state.dart';

import 'app_avatar.dart';

class GlobalProfileAvatar extends StatelessWidget {
  final double baseSize;

  const GlobalProfileAvatar({super.key, this.baseSize = 48});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go(RoutePaths.profile);
      },
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          final userProfile = context.read<ProfileCubit>().userProfile;

          return AppAvatar(imageUrl: userProfile?.image, radius: baseSize / 2);
        },
      ),
    );
  }
}
