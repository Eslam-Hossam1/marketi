import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/extensions/smart_scale_extension.dart';
import 'package:marketi/core/widgets/custom_circular_progress_indecator.dart';
import 'package:marketi/features/profile/presentation/widgets/profile_success_body.dart';

import '../manager/profile_cubit/profile_cubit.dart';
import '../manager/profile_cubit/profile_state.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w(context)),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(child: CustomCircularProgressIndicator());
          } else if (state is ProfileError) {
            return Center(child: Text(state.message));
          } else if (state is ProfileLoaded) {
            return ProfileSuccessBody();
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
