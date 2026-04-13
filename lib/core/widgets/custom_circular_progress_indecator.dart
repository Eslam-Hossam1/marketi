import 'package:flutter/material.dart';

import '../theme/theme_colors_extension.dart';

class CustomCircularProgressIndecator extends StatelessWidget {
  const CustomCircularProgressIndecator({super.key, this.color});
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(color: color ?? context.primaryColor);
  }
}
