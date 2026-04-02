import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/services/storage_services/preferences/preferences_keys.dart';
import 'package:marketi/core/services/storage_services/preferences/preferences_service.dart';
import 'package:marketi/core/utils/assets.dart';
import 'package:marketi/features/onboarding/domain/entities/onboarding_page_entity.dart';

import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final PreferencesService _preferencesService;

  OnboardingCubit(this._preferencesService) : super(const OnboardingInitial());

  final PageController pageController = PageController();
  int currentPage = 0;

  static const List<OnboardingPageEntity> pages = [
    OnboardingPageEntity(
      imagePath: Assets.imagesPngIllustrationOnboarding1,
      title: 'Welcome to Marketi',
      description:
          'Discover a world of endless possibilities and shop from the comfort of your fingertips. Browse through a wide range of products, from fashion and electronics to home.',
    ),
    OnboardingPageEntity(
      imagePath: Assets.imagesPngIllustrationOnboarding2,
      title: 'Easy to Buy',
      description:
          'Find the perfect item that suits your style and needs. With secure payment options and fast delivery, shopping has never been easier.',
    ),
    OnboardingPageEntity(
      imagePath: Assets.imagesPngIllustrationOnboarding3,
      title: 'Wonderful User Experience',
      description:
          'Start exploring now and experience the convenience of online shopping at its best.',
    ),
  ];

  bool get isLastPage => currentPage == pages.length - 1;

  void onPageChanged(int page) {
    currentPage = page;
    emit(OnboardingPageChanged(page));
  }

  void nextPage() {
    if (isLastPage) {
      completeOnboarding();
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> completeOnboarding() async {
    await _preferencesService.setData(
      key: PreferencesKeys.onboardingCompleted,
      value: true,
    );
    emit(const OnboardingCompleted());
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
