import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/widgets/spacing/sliver_height_space.dart';
import 'package:marketi/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:marketi/features/profile/presentation/views/widgets/profile_header.dart';
import 'package:marketi/features/profile/presentation/views/widgets/profile_info_section.dart';
import 'package:marketi/features/profile/presentation/views/widgets/profile_settings_list.dart';

class ProfileSuccessBody extends StatelessWidget {
  const ProfileSuccessBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverHeightSpace(height: 12),
        const SliverToBoxAdapter(child: ProfileHeader()),
        const SliverHeightSpace(height: 32),
        SliverToBoxAdapter(
          child: ProfileInfoSection(
            userProfile: context.read<ProfileCubit>().userProfile!,
          ),
        ),
        const SliverHeightSpace(height: 24),
        const SliverToBoxAdapter(child: ProfileSettingsList()),
      ],
    );
  }
}
