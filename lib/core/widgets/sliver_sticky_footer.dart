import 'package:flutter/material.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';

class SliverStickyFooter extends StatelessWidget {
  const SliverStickyFooter({
    super.key,
    this.bottomPadding,
    required this.children,

    this.horizontalPadding = 0,
  });

  final double? bottomPadding;
  final List<Widget> children;
  final double horizontalPadding;
  @override
  Widget build(BuildContext context) {
    if (children.isEmpty) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: (bottomPadding ?? 30).h(context),
            left: horizontalPadding,
            right: horizontalPadding,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // More appropriate
            children: children,
          ),
        ),
      ),
    );
  }
}
