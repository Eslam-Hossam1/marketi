import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/theme/app_text_styles.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:marketi/core/widgets/avatar/custom_network_circle_image.dart';

class CustomHeaderWithImage extends StatelessWidget {
  final String title;
  const CustomHeaderWithImage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => context.pop(),
          child: Container(
            padding: EdgeInsets.all(12.w(context)),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: context.primaryColor.withValues(alpha: 0.1),
              ),
            ),
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 20.w(context),
              color: context.primaryColor,
            ),
          ),
        ),
        Text(
          title,
          style: AppTextStyles.bold20(context).copyWith(
            color: context.mainTextColor,
          ),
        ),
        const CustomNetworkCircleImage(
          baseSize: 45,
          userImageUrl: "https://static.wikia.nocookie.net/gracieabrams/images/3/39/Billie_Eilish.jpeg/revision/latest?cb=20250318232144",
        ),
      ],
    );
  }
}
