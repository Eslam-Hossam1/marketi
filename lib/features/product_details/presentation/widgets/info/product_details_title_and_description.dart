import 'package:flutter/material.dart';
import 'package:marketi/core/theme/app_text_styles.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:marketi/core/widgets/spacing/height_space.dart';

class ProductDetailsTitleAndDescription extends StatelessWidget {
  final String title;
  final String description;

  const ProductDetailsTitleAndDescription({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.bold22(
            context,
          ).copyWith(color: context.mainTextColor),
        ),
        const HeightSpace(height: 16),
        Text(
          'Product Value',
          style: AppTextStyles.medium18(
            context,
          ).copyWith(color: context.mainTextColor),
        ),
        const HeightSpace(height: 8),
        ProductDetailsDescription(description: description),
      ],
    );
  }
}

class ProductDetailsDescription extends StatefulWidget {
  final String description;

  const ProductDetailsDescription({super.key, required this.description});

  @override
  State<ProductDetailsDescription> createState() =>
      _ProductDetailsDescriptionState();
}

class _ProductDetailsDescriptionState extends State<ProductDetailsDescription> {
  bool _isExpanded = false;

  bool _textExceedsMaxLines(BuildContext context, double maxWidth) {
    final span = TextSpan(
      text: widget.description,
      style: AppTextStyles.regular14(
        context,
      ).copyWith(color: context.secondaryTextColor, height: 1.5),
    );
    final tp = TextPainter(
      text: span,
      maxLines: 3,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: maxWidth);
    return tp.didExceedMaxLines;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final overflows = _textExceedsMaxLines(context, constraints.maxWidth);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.description,
              maxLines: _isExpanded ? null : 3,
              overflow: _isExpanded
                  ? TextOverflow.visible
                  : TextOverflow.ellipsis,
              style: AppTextStyles.regular14(
                context,
              ).copyWith(color: context.secondaryTextColor, height: 1.5),
            ),
            if (overflows && !_isExpanded)
              GestureDetector(
                onTap: () => setState(() => _isExpanded = true),
                child: Text(
                  'See more',
                  style: AppTextStyles.medium14(
                    context,
                  ).copyWith(color: context.primaryColor),
                ),
              ),
          ],
        );
      },
    );
  }
}
