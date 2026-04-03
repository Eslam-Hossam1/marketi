import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../features/otp/domain/entities/otp_reason.dart';
import 'routes_paths.dart';

abstract class RoutingHelper {
  static void pushOtp(BuildContext context, {required OtpReason otpReason}) {
    context.push(RoutePaths.otp, extra: otpReason);
  }
}
