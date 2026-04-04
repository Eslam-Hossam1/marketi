import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:marketi/core/widgets/avatar/custom_file_circle_image.dart';
import 'package:marketi/core/widgets/avatar/custom_network_circle_image.dart';
import 'package:marketi/core/widgets/choose_image_source_bottom_sheet.dart';
import 'package:marketi/features/edit_profile/presentation/manager/edit_profile/edit_profile_cubit.dart';
import 'package:marketi/features/edit_profile/presentation/manager/edit_profile/edit_profile_state.dart';

class EditProfileImagePicker extends StatelessWidget {
  final String currentImageUrl;

  const EditProfileImagePicker({
    super.key,
    required this.currentImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<EditProfileCubit>();

    return BlocBuilder<EditProfileCubit, EditProfileState>(
      buildWhen: (previous, current) =>
          current is EditProfileImagePicked || current is EditProfileInitial,
      builder: (context, state) {
        final isImagePicked = cubit.imageFile != null;
        return Center(
          child: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                backgroundColor: context.scaffoldBackgroundColor,
                context: context,
                builder: (context) {
                  return ChooseImageSourceBottomSheet(
                    pickImageMethod: cubit.pickProfileImage,
                  );
                },
              );
            },
            child: Stack(
              children: [
                isImagePicked
                    ? CustomFileCircleImage(
                        image: cubit.imageFile!,
                        baseSize: 150,
                      )
                    : CustomNetworkCircleImage(
                        baseSize: 150,
                        userImageUrl: currentImageUrl,
                      ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: CircleAvatar(
                    backgroundColor: context.mainTextColor,
                    child: Icon(
                      Icons.camera_alt,
                      size: 25,
                      color: context.scaffoldBackgroundColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

