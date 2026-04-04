import 'package:flutter/material.dart';
import 'package:marketi/features/auth/presentation/widgets/sign_up/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: const SignUpViewBody()));
  }
}
