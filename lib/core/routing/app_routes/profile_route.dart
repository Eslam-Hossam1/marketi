import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/di/service_locator.dart';
import 'package:marketi/core/routing/app_router.dart';
import 'package:marketi/core/routing/routes_paths.dart';
import 'package:marketi/features/edit_profile/domain/usecases/add_image_use_case.dart';
import 'package:marketi/features/edit_profile/domain/usecases/edit_user_data_use_case.dart';
import 'package:marketi/features/edit_profile/presentation/manager/edit_profile/edit_profile_cubit.dart';
import 'package:marketi/features/edit_profile/presentation/views/edit_profile_view.dart';
import 'package:marketi/features/profile/domain/entities/user_profile_entity.dart';
import 'package:marketi/features/theme_selection/presentation/views/theme_selection_view.dart';

/// Only full-screen routes that should be pushed on top of the shell
/// (hiding the bottom nav bar). They use [AppRouter.rootNavigatorKey].
class ProfileRoute {
  static List<GoRoute> routes = [
    GoRoute(
      parentNavigatorKey: AppRouter.rootNavigatorKey,
      path: RoutePaths.themeSelection,
      builder: (context, state) => const ThemeSelectionView(),
    ),
    GoRoute(
      parentNavigatorKey: AppRouter.rootNavigatorKey,
      path: RoutePaths.editProfile,
      builder: (context, state) {
        final userProfile = state.extra as UserProfileEntity;
        return BlocProvider(
          create: (context) => EditProfileCubit(
            getIt<EditUserDataUseCase>(),
            getIt<AddImageUseCase>(),
            userProfile,
          ),
          child: const EditProfileView(),
        );
      },
    ),
  ];
}
