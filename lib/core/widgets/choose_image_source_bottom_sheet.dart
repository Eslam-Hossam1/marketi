import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marketi/core/theme/app_text_styles.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';

class ChooseImageSourceBottomSheet extends StatelessWidget {
  const ChooseImageSourceBottomSheet({
    super.key,
    required this.pickImageMethod,
  });
  final Function({required ImageSource imageSource}) pickImageMethod;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 12,
          ),
          InkWell(
              onTap: () async {
                await pickImageMethod(imageSource: ImageSource.gallery);
                if (!context.mounted) return;
                context.pop();
              },
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                leading: Icon(
                  Icons.image_outlined,
                  size: 24,
                  color: context.mainTextColor,
                ),
                title: Text(
                  "Take From Gallery",
                  style: AppTextStyles.medium16(context)
                      .copyWith(color: context.mainTextColor),
                ),
              )),
          const SizedBox(
            height: 12,
          ),
          InkWell(
              onTap: () async {
                await pickImageMethod(imageSource: ImageSource.camera);
                if (!context.mounted) return;
                context.pop();
              },
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                leading: Icon(
                  Icons.camera_alt_outlined,
                  size: 24,
                  color: context.mainTextColor,
                ),
                title: Text(
                  "Take From Camera",
                  style: AppTextStyles.medium16(context)
                      .copyWith(color: context.mainTextColor),
                ),
              )),
        ],
      ),
    );
  }
}

