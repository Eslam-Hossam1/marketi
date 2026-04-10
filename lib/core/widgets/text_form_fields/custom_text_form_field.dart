import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/theme/app_text_styles.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:marketi/core/utils/form_validators.dart';

class CustomTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String? hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final int? maxLines;
  final TextEditingController? controller;
  final String? initialValue;
  final void Function(String?)? onChanged;
  final bool? enabled;
  final bool? readOnly;
  final InputBorder? border;
  const CustomTextFormField({
    this.onSaved,
    this.prefixSvgPath,
    this.onChanged,
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.validator = FormValidators.customTextFormFieldValidator,
    this.prefixIcon,
    this.keyboardType,
    this.maxLines,
    this.controller,
    this.initialValue,
    this.errorText,
    this.focusNode,
    this.enabled,
    this.readOnly,
    this.border,
    this.autoFocus,
  });
  final String? errorText;
  final FocusNode? focusNode;
  final String? prefixSvgPath;
  final bool? autoFocus;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autoFocus ?? false,
      initialValue: initialValue,
      onSaved: onSaved,
      onChanged: onChanged,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      maxLines: maxLines,
      controller: controller,
      focusNode: focusNode,
      enabled: enabled,
      readOnly: readOnly ?? false,
      decoration: InputDecoration(
        constraints: BoxConstraints(),
        errorText: errorText,
        errorMaxLines: 2,
        prefixIcon: prefixSvgPath != null
            ? Padding(
                padding: EdgeInsetsDirectional.only(
                  start: 16.w(context),
                  end: 8.w(context),
                ),
                child: SvgPicture.asset(
                  prefixSvgPath!,
                  fit: BoxFit.contain,
                  width: 16.w(context),
                ),
              )
            : prefixIcon != null
            ? Padding(
                padding: EdgeInsetsDirectional.only(
                  start: 16.w(context),
                  end: 8.w(context),
                ),
                child: prefixIcon,
              )
            : null,
        isDense: true,
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(
              vertical: 13.h(context),
              horizontal: 12.w(context),
            ),
        border: border,
        focusedBorder:
            focusedBorder ?? buildBorder(context, context.primaryColor),
        focusedErrorBorder: buildBorder(context, const Color(0xffFF2D1B)),
        errorBorder: buildBorder(context, const Color(0xffFF2D1B)),
        enabledBorder:
            enabledBorder ?? buildBorder(context, context.outlineColor, 2),
        hintStyle:
            hintStyle ??
            AppTextStyles.regular14(
              context,
            ).copyWith(color: context.secondaryTextColor),
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
      obscureText: isObscureText ?? false,
      keyboardType: keyboardType,
      style: AppTextStyles.medium16(
        context,
      ).copyWith(color: context.mainTextColor),
      validator: validator,
    );
  }

  OutlineInputBorder buildBorder(
    BuildContext context,
    Color color, [
    double width = 2,
  ]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r(context)),
      borderSide: BorderSide(color: color, width: width),
    );
  }
}
