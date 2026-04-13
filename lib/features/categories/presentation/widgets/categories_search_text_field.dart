import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:marketi/core/widgets/text_form_fields/custom_text_form_field.dart';
import '../manager/categories_cubit/categories_cubit.dart';

class CategoriesSearchTextField extends StatelessWidget {
  const CategoriesSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: "Search for categories...",
      prefixIcon: Icon(
        Icons.search,
        color: context.primaryColor,
        size: 20.w(context),
      ),
      onChanged: (value) {
        context.read<CategoriesCubit>().searchCategories(value!);
      },
    );
  }
}
