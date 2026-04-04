import 'package:flutter/material.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/theme/app_text_styles.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:marketi/core/widgets/custom_cached_network_image.dart';

class HomeProductCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final double price;
  final double rating;
  final String? discount;
  final bool hasAddButton;

  const HomeProductCard({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.rating,
    this.discount,
    this.hasAddButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w(context),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: context.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: context.outlineColor.withValues(alpha: 0.1)),
        boxShadow: [
          BoxShadow(
            color: context.outlineColor.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: .min,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: CustomCachedNetworkImage(
                  url: imageUrl,
                  height: 120.h(context),
                  width: double.infinity,
                ),
              ),
              if (discount != null)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent.withValues(alpha: 0.8),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      discount!,
                      style: AppTextStyles.medium12(
                        context,
                      ).copyWith(color: Colors.white),
                    ),
                  ),
                ),
              const Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.favorite_border,
                    size: 16,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "$price LE",
                      style: AppTextStyles.bold14(
                        context,
                      ).copyWith(color: context.mainTextColor),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 14),
                        const SizedBox(width: 4),
                        Text(
                          rating.toString(),
                          style: AppTextStyles.medium12(
                            context,
                          ).copyWith(color: context.secondaryTextColor),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.medium14(
                    context,
                  ).copyWith(color: context.mainTextColor),
                ),
                if (hasAddButton) ...[
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    height: 32.h(context),
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: context.primaryColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        "Add",
                        style: AppTextStyles.medium14(
                          context,
                        ).copyWith(color: context.primaryColor),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
