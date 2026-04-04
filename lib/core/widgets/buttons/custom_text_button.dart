import 'package:flutter/material.dart';
import 'package:marketi/core/theme/app_text_styles.dart';
import 'package:marketi/core/widgets/buttons/custom_button.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    this.width,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.height,
  });
  final double? width;
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: onPressed,
      isLoading: isLoading,
      width: width,
      height: height,
      child: Text(
        textAlign: TextAlign.center,
        text,
        style: AppTextStyles.semiBold16(context).copyWith(color: Colors.white),
      ),
    );
  }
}
