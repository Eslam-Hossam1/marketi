import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextcart/core/widgets/custom_circular_progress_indecator.dart';
import 'package:nextcart/core/helpers/dialog_helper/dialog_helper.dart';
import 'package:nextcart/core/routing/routes_paths.dart';
import 'package:go_router/go_router.dart';
import 'package:nextcart/features/profile/presentation/widgets/profile_success_body.dart';

import '../manager/profile_cubit/profile_cubit.dart';
import '../manager/profile_cubit/profile_state.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileLogoutLoading) {
          DialogHelper.showLoadingDialog(context);
        } else if (state is ProfileLogoutSuccess) {
          context.pop(); // dismiss loading dialog
          context.go(RoutePaths.login);
        } else if (state is ProfileLogoutError) {
          context.pop(); // dismiss loading dialog
          DialogHelper.showErrorDialog(context, errorMessage: state.message);
        }
      },
      builder: (context, state) {
        if (state is ProfileLoading) {
          return const Center(child: CustomCircularProgressIndecator());
        } else if (state is ProfileError) {
          return Center(child: Text(state.message));
        } else if (state is ProfileLoaded || state is ProfileLogoutLoading || state is ProfileLogoutError || state is ProfileLogoutSuccess) {
          // keep showing success body while logging out or on error
          if (context.read<ProfileCubit>().userProfile != null) {
            return const ProfileSuccessBody();
          }
        }
        return const SizedBox.shrink();
      },
    );
  }
}
