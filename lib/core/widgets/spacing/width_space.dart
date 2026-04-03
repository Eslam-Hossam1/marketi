import 'package:flutter/material.dart';
import 'package:marketi/core/extensions/smart_scale_extension.dart';

class WidthSpace extends StatelessWidget {
  const WidthSpace({super.key, required this.width});

  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width.w(context));
  }
}
