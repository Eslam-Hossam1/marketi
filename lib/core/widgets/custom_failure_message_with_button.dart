import 'package:flutter/material.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/theme/app_text_styles.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:marketi/core/widgets/buttons/custom_button.dart';

class CustomFailureMessageWithButton extends StatelessWidget {
  const CustomFailureMessageWithButton({
    super.key,
    required this.message,
    this.btnText,
    required this.onPressed,
  });
  final String message;
  final String? btnText;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign: TextAlign.center,
            message,
            style: AppTextStyles.semiBold16(
              context,
            ).copyWith(color: context.mainTextColor),
          ),
          SizedBox(height: 24.h(context)),
          CustomButton(
            height: 60.h(context),
            onPressed: onPressed,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                btnText ?? 'Try Again',
                style: AppTextStyles.semiBold14(
                  context,
                ).copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
