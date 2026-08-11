import 'package:flutter/material.dart';
import 'package:nextcart/core/theme/app_text_styles.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';

class ProcessingOverlay extends StatelessWidget {
  const ProcessingOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 16),
              Text(
                'Processing your payment...',
                style: AppTextStyles.bold16(
                  context,
                ).copyWith(color: context.mainTextColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
