import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/widgets/text_form_fields/custom_text_form_field.dart';
import 'package:marketi/features/edit_profile/presentation/manager/edit_profile/edit_profile_cubit.dart';

class EditProfileForm extends StatelessWidget {
  const EditProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<EditProfileCubit>();

    return Column(
      children: [
        CustomTextFormField(
          initialValue: cubit.userProfile.name,
          hintText: "Full Name",
          onSaved: (value) => cubit.formData.name = value!.trim(),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your name';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        CustomTextFormField(
          initialValue: cubit.userProfile.phone,
          hintText: "Phone Number",
          keyboardType: TextInputType.phone,
          onSaved: (value) => cubit.formData.phone = value!.trim(),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your phone number';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        CustomTextFormField(
          initialValue: cubit.userProfile.address,
          hintText: "Address",
          onSaved: (value) => cubit.formData.address = value!.trim(),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your address';
            }
            return null;
          },
        ),
      ],
    );
  }
}

