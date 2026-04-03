import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/helpers/dialog_helper/dialog_helper.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../manager/otp_cubit/otp_cubit.dart';
import 'widgets/otp_view_body.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  late OtpCubit otpCubit;
  @override
  void initState() {
    super.initState();
    otpCubit = context.read<OtpCubit>();
    if (otpCubit.otpReason.sendOtpOnOpening) {
      otpCubit.sendVerificationCode();
    } else {
      otpCubit.showResendButton();
    }
  }

  @override
  Widget build(BuildContext context) {
    final otpToGoOnSuccess = otpCubit.otpReason.toGoOnSuccess;
    return BlocConsumer<OtpCubit, OtpState>(
      listener: (context, state) {
        if (state is OtpFailure) {
          DialogHelper.showErrorDialog(
            context,
            errorMessage: state.errMsg,
            btnOkOnPress: () {},
          );
          otpCubit.showResendButton();
        } else if (state is VerifyOtpSuccess) {
          context.go(
            otpToGoOnSuccess.toGoRoutePath,
            extra: otpToGoOnSuccess.toGoExtra,
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is OtpLoading,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: PopScope(
              onPopInvokedWithResult: (didPop, result) {
                if (didPop) return;
                DialogHelper.showCustomExitConfirmationDialog(
                  context,
                );
              },
              child: const Scaffold(
                body: SafeArea(child: OtpViewBody()),
              ),
            ),
          ),
        );
      },
    );
  }
}
