import 'package:flutter/material.dart';
import 'package:marketi/core/theme/app_text_styles.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:marketi/core/widgets/spacing/height_space.dart';
import 'package:marketi/core/widgets/text_form_fields/email_text_form_field.dart';

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
