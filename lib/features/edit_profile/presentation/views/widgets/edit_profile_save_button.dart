import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/helpers/dialog_helper/dialog_helper.dart';
import 'package:marketi/core/widgets/buttons/custom_text_button.dart';
import 'package:marketi/features/edit_profile/presentation/manager/edit_profile/edit_profile_cubit.dart';
import 'package:marketi/features/edit_profile/presentation/manager/edit_profile/edit_profile_state.dart';

class EditProfileSaveButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final VoidCallback onValidate;

  const EditProfileSaveButton({
    super.key,
    required this.formKey,
    required this.onValidate,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<EditProfileCubit>();
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        if (state is EditProfileSuccess) {
          DialogHelper.showSuccessDialog(
            context,
            message: "Profile updated successfully",
            btnOkOnPress: () {
              context.pop(true);
            },
          );
        } else if (state is EditProfileFailure) {
          DialogHelper.showErrorDialog(context, errorMessage: state.message);
        } else if (state is EditProfileNoChanges) {
          context.pop();
        }
      },
      builder: (context, state) {
        return CustomTextButton(
          width: double.infinity,
          isLoading: state is EditProfileLoading,
          onPressed: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              cubit.updateProfile(cubit.userProfile);
            } else {
              onValidate();
            }
          },
          text: "Save Changes",
        );
      },
    );
  }
}
