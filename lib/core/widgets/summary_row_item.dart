import 'package:flutter/material.dart';
import 'package:nextcart/core/theme/app_text_styles.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';

class SummaryRowItem extends StatelessWidget {
  const SummaryRowItem({
    super.key,
    required this.label,
    required this.value,
    this.labelStyle,
    this.valueStyle,
  });

  final String label;
  final String value;
  final TextStyle? labelStyle;
  final TextStyle? valueStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: labelStyle ??
              AppTextStyles.regular14(context)
                  .copyWith(color: context.mainTextColor),
        ),
        Text(
          value,
          style: valueStyle ??
              AppTextStyles.semiBold14(context)
                  .copyWith(color: context.mainTextColor),
        ),
      ],
    );
  }
}
