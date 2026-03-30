import 'package:flutter/material.dart';

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  final Color mainTextColor;
  final Color secondaryTextColor;
  final Color formColor;
  final Color toastColor;
  final Color cachedNetworkImagePlaceholderColor;
  final Color myChatBubbleBackground;
  final Color otherChatBubbleBackground;
  final Color myChatBubbleTextColor;
  final Color otherChatBubbleTextColor;
  final Color myChatBubbleTimeTextColor;
  final Color otherChatBubbleTimeTextColor;
  const CustomColors({
    required this.mainTextColor,
    required this.secondaryTextColor,
    required this.formColor,
    required this.toastColor,
    required this.cachedNetworkImagePlaceholderColor,
    required this.myChatBubbleBackground,
    required this.otherChatBubbleBackground,
    required this.myChatBubbleTextColor,
    required this.otherChatBubbleTextColor,
    required this.myChatBubbleTimeTextColor,
    required this.otherChatBubbleTimeTextColor,
  });

  @override
  CustomColors copyWith({
    Color? mainTextColor,
    Color? secondaryTextColor,
    Color? formColor,
    Color? toastColor,
    Color? cachedNetworkImagePlaceholderColor,
    Color? myChatBubbleBackground,
    Color? otherChatBubbleBackground,
    Color? myChatBubbleTextColor,
    Color? otherChatBubbleTextColor,
    Color? myChatBubbleTimeTextColor,
    Color? otherChatBubbleTimeTextColor,
  }) {
    return CustomColors(
      mainTextColor: mainTextColor ?? this.mainTextColor,
      secondaryTextColor: secondaryTextColor ?? this.secondaryTextColor,
      formColor: formColor ?? this.formColor,
      toastColor: toastColor ?? this.toastColor,
      cachedNetworkImagePlaceholderColor:
          cachedNetworkImagePlaceholderColor ??
          this.cachedNetworkImagePlaceholderColor,
      myChatBubbleBackground:
          myChatBubbleBackground ?? this.myChatBubbleBackground,
      otherChatBubbleBackground:
          otherChatBubbleBackground ?? this.otherChatBubbleBackground,
      myChatBubbleTextColor:
          myChatBubbleTextColor ?? this.myChatBubbleTextColor,
      otherChatBubbleTextColor:
          otherChatBubbleTextColor ?? this.otherChatBubbleTextColor,
      myChatBubbleTimeTextColor:
          myChatBubbleTimeTextColor ?? this.myChatBubbleTimeTextColor,
      otherChatBubbleTimeTextColor:
          otherChatBubbleTimeTextColor ?? this.otherChatBubbleTimeTextColor,
    );
  }

  @override
  CustomColors lerp(CustomColors? other, double t) {
    if (other == null) return this;
    return CustomColors(
      mainTextColor: Color.lerp(mainTextColor, other.mainTextColor, t)!,
      secondaryTextColor: Color.lerp(
        secondaryTextColor,
        other.secondaryTextColor,
        t,
      )!,
      formColor: Color.lerp(formColor, other.formColor, t)!,
      toastColor: Color.lerp(toastColor, other.toastColor, t)!,
      cachedNetworkImagePlaceholderColor: Color.lerp(
        cachedNetworkImagePlaceholderColor,
        other.cachedNetworkImagePlaceholderColor,
        t,
      )!,
      myChatBubbleBackground: Color.lerp(
        myChatBubbleBackground,
        other.myChatBubbleBackground,
        t,
      )!,
      otherChatBubbleBackground: Color.lerp(
        otherChatBubbleBackground,
        other.otherChatBubbleBackground,
        t,
      )!,
      myChatBubbleTextColor: Color.lerp(
        myChatBubbleTextColor,
        other.myChatBubbleTextColor,
        t,
      )!,
      otherChatBubbleTextColor: Color.lerp(
        otherChatBubbleTextColor,
        other.otherChatBubbleTextColor,
        t,
      )!,
      myChatBubbleTimeTextColor: Color.lerp(
        myChatBubbleTimeTextColor,
        other.myChatBubbleTimeTextColor,
        t,
      )!,
      otherChatBubbleTimeTextColor: Color.lerp(
        otherChatBubbleTimeTextColor,
        other.otherChatBubbleTimeTextColor,
        t,
      )!,
    );
  }
}
