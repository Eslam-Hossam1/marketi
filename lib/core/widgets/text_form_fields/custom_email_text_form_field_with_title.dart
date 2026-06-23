import 'package:flutter/material.dart';
import 'package:nexcart/core/theme/app_text_styles.dart';
import 'package:nexcart/core/theme/theme_colors_extension.dart';
import 'package:nexcart/core/widgets/spacing/height_space.dart';
import 'package:nexcart/core/widgets/text_form_fields/email_text_form_field.dart';

class CustomEmailTextFormFieldWithTitle extends StatelessWidget {
  const CustomEmailTextFormFieldWithTitle({
    super.key,
    this.onSaved,
    this.title = 'Username',
  });
  final void Function(String?)? onSaved;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          title,
          style: AppTextStyles.medium18(
            context,
          ).copyWith(color: context.secondaryColor),
        ),
        HeightSpace(height: 8),
        EmailTextFormField(onSaved: onSaved),
      ],
    );
  }
}
