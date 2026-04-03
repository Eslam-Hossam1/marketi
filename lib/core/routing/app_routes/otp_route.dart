import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../features/otp/data/repos/otp_repo_impl.dart';
import '../../../features/otp/domain/entities/otp_reason.dart';
import '../../../features/otp/domain/usecases/send_otp_usecase.dart';
import '../../../features/otp/domain/usecases/verify_otp_usecase.dart';
import '../../../features/otp/presentation/manager/otp_cubit/otp_cubit.dart';
import '../../../features/otp/presentation/views/otp_view.dart';
import '../../di/service_locator.dart';
import '../routes_paths.dart';

class OtpRoute {
  static GoRoute otp = GoRoute(
      path: RoutePaths.otp,
      builder: (context, state) {
        final OtpReason otpReason = state.extra as OtpReason;
        return BlocProvider(
          create: (context) => OtpCubit(
            sendOtpUsecase: SendOtpUsecase(otpRepo: getIt<OtpRepoImpl>()),
            verifyOtpUsecase: VerifyOtpUsecase(otpRepo: getIt<OtpRepoImpl>()),
            otpReason: otpReason,
          ),
          child: const OtpView(),
        );
      });

  static List<GoRoute> routes = [
    otp,
  ];
}
