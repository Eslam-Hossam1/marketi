import 'package:flutter/material.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';

class SliverWidthSpace extends StatelessWidget {
  const SliverWidthSpace({super.key, required this.width});

  final double width;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: SizedBox(width: width.w(context)));
  }
}
