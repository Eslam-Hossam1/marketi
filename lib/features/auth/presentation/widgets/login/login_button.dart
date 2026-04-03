import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/helpers/dialog_helper/dialog_helper.dart';
import 'package:marketi/core/routing/routes_paths.dart';
import 'package:marketi/core/widgets/buttons/custom_text_button.dart';
import 'package:marketi/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:marketi/features/auth/presentation/manager/login_cubit/login_state.dart';
import 'package:go_router/go_router.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final void Function() enableAutoValidation;

  const LoginButton({
    super.key,
    required this.formKey,
    required this.enableAutoValidation,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          context.go(RoutePaths.home);
        } else if (state is LoginFailure) {
          DialogHelper.showErrorDialog(context, errorMessage: state.errMsg);
        }
      },
      builder: (context, state) {
        return CustomTextButton(
          width: double.infinity,
          text: 'Login',
          isLoading: state is LoginLoading,
          onPressed: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              context.read<LoginCubit>().login();
            } else {
              enableAutoValidation();
            }
          },
        );
      },
    );
  }
}
