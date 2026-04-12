import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:marketi/core/widgets/text_form_fields/custom_text_form_field.dart';
import '../manager/search_cubit/search_cubit.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: "What are you looking for ?",
      prefixIcon: Icon(
        Icons.search,
        color: context.mainTextColor,
        size: 24.w(context),
      ),
      suffixIcon: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: context.primaryColor.withValues(alpha: 0.2),
          ),
        ),
        child: Icon(
          Icons.tune,
          color: context.primaryColor,
          size: 20.w(context),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.r(context)),
        borderSide: BorderSide(
          color: context.primaryColor.withValues(alpha: 0.2),
          width: 2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.r(context)),
        borderSide: BorderSide(
          color: context.primaryColor,
          width: 2,
        ),
      ),
      onChanged: (value) {
        context.read<SearchCubit>().firstFetchSearch(value!);
      },
      onFieldSubmitted: (value) {
        context.read<SearchCubit>().firstFetchSearch(value);
      },
    );
  }
}
