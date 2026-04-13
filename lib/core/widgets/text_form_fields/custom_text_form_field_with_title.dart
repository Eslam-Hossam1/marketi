import 'package:flutter/material.dart';
import 'package:marketi/core/theme/app_text_styles.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:marketi/core/widgets/spacing/height_space.dart';
import 'package:marketi/core/widgets/text_form_fields/custom_text_form_field.dart';
import 'package:marketi/core/utils/form_validators.dart';

class CustomTextFormFieldWithTitle extends StatelessWidget {
  const CustomTextFormFieldWithTitle({
    this.prefixSvgPath,
    this.prefixIcon,
    super.key,
    required this.title,
    required this.hint,
    this.onChanged,
    this.validator = FormValidators.customTextFormFieldValidator,
    this.onSaved,
    this.enabledBorder,
    this.focusedBorder,
    this.titleStyle,
    this.initialValue,
    this.controller,
    this.keyboardType,
  });
  final String title;
  final String hint;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final TextStyle? titleStyle;
  final String? initialValue;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? prefixSvgPath;
  final Widget? prefixIcon;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style:
              titleStyle ??
              AppTextStyles.semiBold14(
                context,
              ).copyWith(color: context.mainTextColor),
        ),
        HeightSpace(height: 4),
        CustomTextFormField(
          prefixIcon: prefixIcon,
          prefixSvgPath: prefixSvgPath,
          initialValue: initialValue,
          onSaved: onSaved,
          hintText: hint,
          validator: validator,
          enabledBorder: enabledBorder,
          focusedBorder: focusedBorder,
          onChanged: onChanged,
          controller: controller,
          keyboardType: keyboardType,
        ),
      ],
    );
  }
}
