import 'package:flutter/material.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';

class SliverHeightSpace extends StatelessWidget {
  const SliverHeightSpace({super.key, required this.height});

  final double height;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: SizedBox(height: height.h(context)));
  }
}
