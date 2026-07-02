import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextcart/core/widgets/custom_circular_progress_indecator.dart';
import 'package:nextcart/core/widgets/custom_failure_message_with_button.dart';
import 'package:nextcart/features/favorites/presentation/manager/favorites_cubit/favorites_cubit.dart';
import 'package:nextcart/features/favorites/presentation/manager/favorites_cubit/favorites_state.dart';
import 'package:nextcart/features/favorites/presentation/widgets/favorites_empty_widget.dart';
import 'package:nextcart/features/favorites/presentation/widgets/favorites_view_body.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<FavoritesCubit, FavoritesState>(
          buildWhen: (previous, current) =>
              current is FavoritesLoading ||
              current is FavoritesSuccess ||
              current is FavoritesFailure ||
              current is FavoritesEmpty ||
              current is FavoriteToggled ||
              current is FavoriteToggleReverted,
          builder: (context, state) {
            final cubit = context.read<FavoritesCubit>();

            if (state is FavoritesLoading) {
              return const CustomCircularProgressIndecator();
            }
            if (state is FavoritesFailure) {
              return CustomFailureMessageWithButton(
                failureMessage: state.errorMessage,
                onPressed: () => cubit.getFavorites(),
              );
            }
            if (state is FavoritesEmpty || (cubit.favorites.isEmpty && state is! FavoritesInitial)) {
              return const FavoritesEmptyWidget();
            }
            return const FavoritesViewBody();
          },
        ),
      ),
    );
  }
}
