import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/routing/routes_paths.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:marketi/core/widgets/text_form_fields/custom_text_form_field.dart';

class HomeSearchTextField extends StatelessWidget {
  const HomeSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GestureDetector(
        onTap: () => context.push(RoutePaths.search),
        child: AbsorbPointer(
          child: CustomTextFormField(
            hintText: "What are you looking for ?",
            prefixIcon: Icon(
              Icons.search,
              color: context.primaryColor,
              size: 20.w(context),
            ),
            suffixIcon: Icon(
              Icons.tune,
              color: context.primaryColor,
              size: 20.w(context),
            ),
          ),
        ),
      ),
    );
  }
}
