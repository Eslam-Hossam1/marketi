import 'package:flutter/material.dart';
import 'package:marketi/core/theme/app_text_styles.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:marketi/core/widgets/avatar/custom_network_circle_image.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          const CustomNetworkCircleImage(
            baseSize: 48,
            userImageUrl: "https://static.wikia.nocookie.net/gracieabrams/images/3/39/Billie_Eilish.jpeg/revision/latest?cb=20250318232144",
          ),
          const SizedBox(width: 12),
          Text(
            "Hi Yousef !",
            style: AppTextStyles.bold20(context).copyWith(
              color: context.mainTextColor,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none_outlined,
              color: context.primaryColor,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
