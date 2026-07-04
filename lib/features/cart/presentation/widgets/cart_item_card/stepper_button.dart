import 'package:flutter/material.dart';
import 'package:nextcart/core/extensions/responsive_extension.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';

class StepperButton extends StatelessWidget {
  final bool isDelete;
  final bool isRound;
  final bool isLoading;
  final IconData icon;
  final VoidCallback? onTap;

  const StepperButton({
    super.key,
    required this.isDelete,
    required this.isRound,
    required this.isLoading,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = isDelete
        ? Colors.red.withValues(alpha: 0.12)
        : context.primaryColor.withValues(alpha: 0.12);
    final iconColor = isDelete ? Colors.red : context.primaryColor;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 42.w(context),
        height: 36.h(context),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(
            isRound ? 18.r(context) : 10.r(context),
          ),
        ),
        child: isLoading
            ? Center(
                child: SizedBox(
                  width: 16.w(context),
                  height: 16.w(context),
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: iconColor,
                  ),
                ),
              )
            : Icon(
                icon,
                size: 20.w(context),
                color: onTap == null
                    ? iconColor.withValues(alpha: 0.4)
                    : iconColor,
              ),
      ),
    );
  }
}
