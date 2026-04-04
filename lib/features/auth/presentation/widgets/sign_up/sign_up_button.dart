import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/helpers/dialog_helper/dialog_helper.dart';
import 'package:marketi/core/routing/routes_paths.dart';
import 'package:marketi/core/widgets/buttons/custom_text_button.dart';
import 'package:marketi/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:marketi/features/auth/presentation/manager/sign_up_cubit/sign_up_state.dart';
import 'package:go_router/go_router.dart';

class SignUpButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final void Function() enableAutoValidation;

  const SignUpButton({
    super.key,
    required this.formKey,
    required this.enableAutoValidation,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          context.go(RoutePaths.home);
        } else if (state is SignUpFailure) {
          DialogHelper.showErrorDialog(context, errorMessage: state.errMsg);
        }
      },
      builder: (context, state) {
        return CustomTextButton(
          width: double.infinity,
          text: 'Sign Up',
          isLoading: state is SignUpLoading,
          onPressed: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              context.read<SignUpCubit>().signUp();
            } else {
              enableAutoValidation();
            }
          },
        );
      },
    );
  }
}
