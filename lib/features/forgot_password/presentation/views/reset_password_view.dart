import 'package:flutter/material.dart';
import 'package:marketi/features/forgot_password/presentation/widgets/reset_password_view_body.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: ResetPasswordViewBody()),
    );
  }
}
