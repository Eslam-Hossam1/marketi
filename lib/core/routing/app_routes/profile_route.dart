import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/di/service_locator.dart';
import 'package:marketi/core/routing/routes_paths.dart';
import 'package:marketi/features/edit_profile/domain/usecases/add_image_use_case.dart';
import 'package:marketi/features/edit_profile/domain/usecases/edit_user_data_use_case.dart';
import 'package:marketi/features/edit_profile/presentation/manager/edit_profile/edit_profile_cubit.dart';
import 'package:marketi/features/edit_profile/presentation/views/edit_profile_view.dart';
import 'package:marketi/features/profile/domain/entities/user_profile_entity.dart';
import 'package:marketi/features/profile/presentation/views/profile_view.dart';


class ProfileRoute {
  static List<GoRoute> routes = [
    GoRoute(
      path: RoutePaths.profile,
      builder: (context, state) => const ProfileView(),
    ),
    GoRoute(
      path: RoutePaths.editProfile,
      builder: (context, state) {
        // final userProfile = UserProfileEntity(
        //   id: 'id',
        //   name: 'name',
        //   phone: 'phone',
        //   email: 'email@gmail.com',
        //   address: 'address',
        //   image:
        //       'https://static.wikia.nocookie.net/gracieabrams/images/3/39/Billie_Eilish.jpeg/revision/latest?cb=20250318232144',
        // );
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
