import 'package:flutter/material.dart';
import 'package:marketi/core/theme/app_text_styles.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:marketi/core/widgets/spacing/height_space.dart';
import 'package:marketi/features/profile/presentation/views/widgets/profile_galaxy_image.dart';

import '../../../domain/entities/user_profile_entity.dart';

class ProfileInfoSection extends StatelessWidget {
  final UserProfileEntity userProfile;

  const ProfileInfoSection({super.key, required this.userProfile});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileGalaxyImage(userProfile: userProfile),
        const HeightSpace(height: 16),
        Text(
          userProfile.name,
          style: AppTextStyles.bold20(
            context,
          ).copyWith(color: context.mainTextColor),
        ),
        const HeightSpace(height: 4),
        Text(
          userProfile.email,
          style: AppTextStyles.regular14(
            context,
          ).copyWith(color: context.secondaryTextColor),
        ),
      ],
    );
  }
}
