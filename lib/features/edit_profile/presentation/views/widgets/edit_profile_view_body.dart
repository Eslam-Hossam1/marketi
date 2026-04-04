import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/extensions/smart_scale_extension.dart';
import 'package:marketi/core/widgets/custom_back_button_with_title_header.dart';
import 'package:marketi/core/widgets/spacing/sliver_height_space.dart';
import 'package:marketi/core/widgets/sliver_sticky_footer.dart';
import 'package:marketi/features/edit_profile/presentation/manager/edit_profile/edit_profile_cubit.dart';
import 'package:marketi/features/edit_profile/presentation/views/widgets/edit_profile_form.dart';
import 'package:marketi/features/edit_profile/presentation/views/widgets/edit_profile_image_picker.dart';
import 'package:marketi/features/edit_profile/presentation/views/widgets/edit_profile_save_button.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({super.key});

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  void _onValidate() {
    if (_autovalidateMode == AutovalidateMode.disabled) {
      setState(() {
        _autovalidateMode = AutovalidateMode.always;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<EditProfileCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w(context)),
      child: Form(
        key: _formKey,
        autovalidateMode: _autovalidateMode,
        child: CustomScrollView(
          slivers: [
            const SliverHeightSpace(height: 12),
            const SliverToBoxAdapter(
              child: CustomBackButtonWithTitleHeader(title: "Edit Profile"),
            ),
            const SliverHeightSpace(height: 24),
            SliverToBoxAdapter(
              child: EditProfileImagePicker(
                currentImageUrl: cubit.userProfile.image,
              ),
            ),
            const SliverHeightSpace(height: 32),
            const EditProfileForm(),
            SliverStickyFooter(
              children: [
                EditProfileSaveButton(
                  formKey: _formKey,
                  onValidate: _onValidate,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
