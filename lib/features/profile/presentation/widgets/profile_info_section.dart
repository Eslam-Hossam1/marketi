import 'package:flutter/material.dart';
import 'package:nextcart/core/theme/app_text_styles.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';
import 'package:nextcart/core/widgets/spacing/height_space.dart';
import 'package:nextcart/features/profile/presentation/widgets/profile_galaxy_image.dart';

import '../../domain/entities/user_profile_entity.dart';

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
