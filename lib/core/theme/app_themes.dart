import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'custom_colors.dart';

abstract class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    textTheme: GoogleFonts.poppinsTextTheme(),
    dialogBackgroundColor: AppColors.lightDialogBackground,
    scaffoldBackgroundColor: AppColors.lightScaffoldBackground,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: AppColors.lightPrimary,
      secondary: AppColors.lightSecondary,
      onSurfaceVariant: AppColors.lightOnSurfaceVariant,
      outline: AppColors.lightOutline,
    ),
    extensions: const <ThemeExtension<dynamic>>[
      CustomColors(
        mainTextColor: AppColors.lightMainTextColor,
        secondaryTextColor: AppColors.lightSecondaryTextColor,
        formColor: AppColors.lightFormColor,
        toastColor: AppColors.lightToastBackground,
        cachedNetworkImagePlaceholderColor:
            AppColors.lightCachedNetworkImagePlacholderColor,
        myChatBubbleBackground: AppColors.lightMyChatBubbleBackground,
        otherChatBubbleBackground: AppColors.lightOtherChatBubbleBackground,
        myChatBubbleTextColor: AppColors.lightMyChatBubbleTextColor,
        otherChatBubbleTextColor: AppColors.lightOtherChatBubbleTextColor,
        myChatBubbleTimeTextColor: AppColors.lightMyChatBubbleTimeTextColor,
        otherChatBubbleTimeTextColor:
            AppColors.lightOtherChatBubbleTimeTextColor,
      ),
    ],
  );

  static final ThemeData darkTheme = ThemeData(
    textTheme: GoogleFonts.poppinsTextTheme(),
    dialogBackgroundColor: AppColors.darkDialogBackground,
    scaffoldBackgroundColor: AppColors.darkScaffoldBackground,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.darkPrimary,
      secondary: AppColors.darkSecondary,
      onSurfaceVariant: AppColors.darkOnSurfaceVariant,
      surface: AppColors.darkSurface,
      outline: AppColors.darkOutline,
    ),
    brightness: Brightness.dark,
    extensions: const <ThemeExtension<dynamic>>[
      CustomColors(
        mainTextColor: AppColors.darkMainTextColor,
        secondaryTextColor: AppColors.darkSecondaryTextColor,
        formColor: AppColors.darkFormColor,
        toastColor: AppColors.darkToastBackground,
        cachedNetworkImagePlaceholderColor:
            AppColors.darkCachedNetworkImagePlacholderColor,
        myChatBubbleBackground: AppColors.darkMyChatBubbleBackground,
        otherChatBubbleBackground: AppColors.darkOtherChatBubbleBackground,
        myChatBubbleTextColor: AppColors.darkMyChatBubbleTextColor,
        otherChatBubbleTextColor: AppColors.darkOtherChatBubbleTextColor,
        myChatBubbleTimeTextColor: AppColors.darkMyChatBubbleTimeTextColor,
        otherChatBubbleTimeTextColor:
            AppColors.darkOtherChatBubbleTimeTextColor,
      ),
    ],
  );
}
