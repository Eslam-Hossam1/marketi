import 'package:flutter/material.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/theme/app_text_styles.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:marketi/core/widgets/avatar/custom_network_circle_image.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w(context),
        vertical: 12.h(context),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 45.w(context)),
          Text(
            'Cart',
            style: AppTextStyles.bold20(context).copyWith(
              color: context.mainTextColor,
            ),
          ),
          const CustomNetworkCircleImage(
            baseSize: 45,
            userImageUrl:
                "https://static.wikia.nocookie.net/gracieabrams/images/3/39/Billie_Eilish.jpeg/revision/latest?cb=20250318232144",
          ),
        ],
      ),
    );
  }
}
