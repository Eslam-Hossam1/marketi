import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nexcart/core/extensions/responsive_extension.dart';
import 'package:nexcart/core/theme/theme_colors_extension.dart';
import 'package:nexcart/core/utils/assets.dart';
import 'package:nexcart/core/widgets/custom_cached_network_image.dart';
import 'package:nexcart/features/profile/domain/entities/user_profile_entity.dart';

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
                child: Stack(
                  children: [
                    ClipOval(
                      child: CustomCachedNetworkImage(
                        url: userProfile.image,
                        width: 150.w(context),
                        height: 150.w(context),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 18.r(context),
                        backgroundColor: context.scaffoldBackgroundColor,
                        child: GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                            Assets.imagesSvgCameraAddIcon,
                            width: 20.w(context),
                            colorFilter: ColorFilter.mode(
                              context.primaryColor,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
