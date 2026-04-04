import 'package:flutter/material.dart';
import 'package:marketi/core/extensions/responsive_extension.dart';

class HeightSpace extends StatelessWidget {
  const HeightSpace({super.key, required this.height});

  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height.h(context));
  }
}
