import 'package:flutter/material.dart';

class ClickableText extends StatelessWidget {
  const ClickableText({super.key, required this.text, this.style, this.onTap});
  final String text;
  final TextStyle? style;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
