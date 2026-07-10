import 'package:flutter/material.dart';

import 'package:nextcart/core/extensions/responsive_extension.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';
import 'package:nextcart/core/utils/assets.dart';
import 'package:nextcart/core/widgets/avatar/app_avatar.dart';
import 'package:nextcart/features/profile/domain/entities/user_profile_entity.dart';

class ProfileGalaxyImage extends StatelessWidget {
  const ProfileGalaxyImage({super.key, required this.userProfile});

  final UserProfileEntity userProfile;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            context.theme.brightness == Brightness.dark
                ? Assets.imagesPngProfileGalaxyCirclesDark
                : Assets.imagesPngProfileGalaxyCircles,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(50.w(context)),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.primaryColor,
          ),
          child: Container(
            margin: EdgeInsets.all(3.w(context)),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.scaffoldBackgroundColor,
            ),
            child: Padding(
              padding: EdgeInsets.all(3.w(context)),
              child: Center(
                child: AppAvatar(
                  imageUrl: userProfile.image,
                  radius: 75.w(context),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
