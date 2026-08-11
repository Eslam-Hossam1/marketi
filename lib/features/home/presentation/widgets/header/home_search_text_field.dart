import 'package:flutter/material.dart';
import 'package:nextcart/core/extensions/responsive_extension.dart';
import 'package:nextcart/core/routing/routing_helper.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';
import 'package:nextcart/core/widgets/text_form_fields/custom_text_form_field.dart';

class HomeSearchTextField extends StatelessWidget {
  const HomeSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GestureDetector(
        onTap: () => RoutingHelper.pushSearch(context),
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
