import 'package:flutter/material.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/theme/app_text_styles.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';

class ObscureTextFormField extends StatefulWidget {
  const ObscureTextFormField({
    super.key,
    required this.hintText,
    this.onSaved,
    this.validator,
    this.onChanged,
    this.controller,
    this.prefixIcon,
  });
  final Widget? prefixIcon;

  final String hintText;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextEditingController? controller;

  @override
  State<ObscureTextFormField> createState() => _ObscureTextFormFieldState();
}

class _ObscureTextFormFieldState extends State<ObscureTextFormField> {
  bool isObscure = true;

  void toggleObscure() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onSaved: widget.onSaved,
      onChanged: widget.onChanged,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      validator: widget.validator,
      obscureText: isObscure,
      cursorColor: context.primaryColor,
      style: AppTextStyles.medium16(
        context,
      ).copyWith(color: context.mainTextColor),
      decoration: InputDecoration(
        constraints: BoxConstraints(),
        errorMaxLines: 2,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(
          vertical: 13.h(context),
          horizontal: 12.w(context),
        ),
        hintText: widget.hintText,
        hintStyle: AppTextStyles.regular14(
          context,
        ).copyWith(color: context.secondaryTextColor),
        suffixIconConstraints: BoxConstraints(),
        prefixIcon: widget.prefixIcon != null
            ? Padding(
                padding: EdgeInsetsDirectional.only(
                  start: 16.w(context),
                  end: 8.w(context),
                ),
                child: widget.prefixIcon,
              )
            : null,
        suffixIcon: Padding(
          padding: EdgeInsetsDirectional.only(
            start: 8.w(context),
            end: 16.w(context),
          ),
          child: IconButton(
            onPressed: toggleObscure,
            icon: Icon(
              isObscure ? Icons.visibility : Icons.visibility_off,
              color: context.mainTextColor,
              size: 24,
            ),
          ),
        ),
        focusedBorder: _buildBorder(context, context.primaryColor),
        focusedErrorBorder: _buildBorder(context, const Color(0xffFF2D1B)),
        errorBorder: _buildBorder(context, const Color(0xffFF2D1B)),
        enabledBorder: _buildBorder(context, context.outlineColor, 2),
      ),
    );
  }

  OutlineInputBorder _buildBorder(
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
