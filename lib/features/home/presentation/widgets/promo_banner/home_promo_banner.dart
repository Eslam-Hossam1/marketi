import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextcart/core/extensions/responsive_extension.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';
import 'package:nextcart/core/widgets/custom_cached_network_image.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../manager/banners_cubit/banners_cubit.dart';
import '../../manager/banners_cubit/banners_state.dart';

class HomePromoBanner extends StatefulWidget {
  const HomePromoBanner({super.key});

  @override
  State<HomePromoBanner> createState() => _HomePromoBannerState();
}

class _HomePromoBannerState extends State<HomePromoBanner> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannersCubit, BannersState>(
      builder: (context, state) {
        if (state is BannersLoaded && state.banners.isNotEmpty) {
          return Column(
            children: [
              AspectRatio(
                aspectRatio: 21 / 9,
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 4),
                    enlargeCenterPage: true,
                    viewportFraction: 0.9,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  items: state.banners.map((banner) {
                    return GestureDetector(
                      onTap: () {
                        context.read<BannersCubit>().onBannerTapped(
                          banner,
                          context,
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: CustomCachedNetworkImage(
                          url: banner.imageUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 12),
              // Dot indicators
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: state.banners.asMap().entries.map((entry) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    width: _currentIndex == entry.key ? 24.0 : 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: _currentIndex == entry.key
                          ? Theme.of(context).primaryColor
                          : Colors.grey.withValues(alpha: 0.4),
                    ),
                  );
                }).toList(),
              ),
            ],
          );
        } else if (state is BannersLoading || state is BannersInitial) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Skeletonizer(
              enabled: true,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  height: 160.h(context),
                  color: context.cachedNetworkImagePlaceholderColor,
                ),
              ),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
