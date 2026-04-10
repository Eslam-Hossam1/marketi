import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:marketi/core/widgets/text_form_fields/custom_text_form_field.dart';
import 'package:marketi/core/widgets/spacing/height_space.dart';
import 'package:marketi/core/widgets/spacing/width_space.dart';
import 'package:go_router/go_router.dart';
import '../manager/search_cubit/search_cubit.dart';
import 'search_results_grid.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeightSpace(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              IconButton(
                onPressed: () => context.pop(),
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  size: 20.w(context),
                  color: context.primaryColor,
                ),
              ),
              const WidthSpace(width: 8),
              Expanded(
                child: CustomTextFormField(
                  hintText: "What are you looking for ?",
                  prefixIcon: Icon(
                    Icons.search,
                    color: context.primaryColor,
                    size: 20.w(context),
                  ),
                  autoFocus: true,
                  onChanged: (value) {
                    context.read<SearchCubit>().searchProducts(value!);
                  },
                ),
              ),
            ],
          ),
        ),
        const HeightSpace(height: 24),
        const Expanded(
          child: SearchResultsGrid(),
        ),
      ],
    );
  }
}
