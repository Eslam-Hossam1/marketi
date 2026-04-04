import 'package:flutter/material.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.backgroundColor,
    required this.child,
    this.onPressed,
    this.width,
    this.borderRadius,
    this.verticalPadding,
    this.height,
    this.isLoading = false,
  });
  final Color? backgroundColor;
  final Widget child;
  final bool isLoading;
  final VoidCallback? onPressed;
  final double? width;
  final double? borderRadius;
  final double? verticalPadding;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? 52.h(context),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor ?? context.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 12.r(context)),
          ),
        ),
        onPressed: onPressed,
        child: isLoading
            ? Center(child: CircularProgressIndicator(color: Colors.white))
            : Padding(
                padding: EdgeInsets.symmetric(
                  vertical: verticalPadding ?? 6.h(context),
                ),
                child: child,
              ),
      ),
    );
  }
}
