import 'package:flutter/widgets.dart';
import 'package:marketi/core/theme/theme_colors_extension.dart';
import 'package:marketi/core/utils/smart_scaler.dart';

abstract class AppTextStyles {
  // Font size 68
  static TextStyle bold68(
    BuildContext context, {
    double? lowerLimitRatio,
    double? upperLimitRatio,
    bool useBreakpoints = false,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: _getResponsiveText(
        context,
        baseFontSize: 68,
        lowerLimitRatio: lowerLimitRatio,
        upperLimitRatio: upperLimitRatio,
        useBreakpoints: useBreakpoints,
      ),
    );
  }

  static TextStyle regular68(
    BuildContext context, {
    double? lowerLimitRatio,
    double? upperLimitRatio,
    bool useBreakpoints = false,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: _getResponsiveText(
        context,
        baseFontSize: 68,
        lowerLimitRatio: lowerLimitRatio,
        upperLimitRatio: upperLimitRatio,
        useBreakpoints: useBreakpoints,
      ),
    );
  }

  // Font size 40
  static TextStyle bold40(
    BuildContext context, {
    double? lowerLimitRatio,
    double? upperLimitRatio,
    bool useBreakpoints = false,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: _getResponsiveText(
        context,
        baseFontSize: 40,
        lowerLimitRatio: lowerLimitRatio,
        upperLimitRatio: upperLimitRatio,
        useBreakpoints: useBreakpoints,
      ),
    );
  }

  static TextStyle medium40(
    BuildContext context, {
    double? lowerLimitRatio,
    double? upperLimitRatio,
    bool useBreakpoints = false,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: _getResponsiveText(
        context,
        baseFontSize: 40,
        lowerLimitRatio: lowerLimitRatio,
        upperLimitRatio: upperLimitRatio,
        useBreakpoints: useBreakpoints,
      ),
    );
  }

  // Font size 26
  static TextStyle regular26(
    BuildContext context, {
    double? lowerLimitRatio,
    double? upperLimitRatio,
    bool useBreakpoints = false,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: _getResponsiveText(
        context,
        baseFontSize: 26,
        lowerLimitRatio: lowerLimitRatio,
        upperLimitRatio: upperLimitRatio,
        useBreakpoints: useBreakpoints,
      ),
    );
  }

  // Font size 25
  static TextStyle bold25(
    BuildContext context, {
    double? lowerLimitRatio,
    double? upperLimitRatio,
    bool useBreakpoints = false,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: _getResponsiveText(
        context,
        baseFontSize: 25,
        lowerLimitRatio: lowerLimitRatio,
        upperLimitRatio: upperLimitRatio,
        useBreakpoints: useBreakpoints,
      ),
    );
  }

  static TextStyle bold20(
    BuildContext context, {
    double? lowerLimitRatio,
    double? upperLimitRatio,
    bool useBreakpoints = false,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: _getResponsiveText(
        context,
        baseFontSize: 20,
        lowerLimitRatio: lowerLimitRatio,
        upperLimitRatio: upperLimitRatio,
        useBreakpoints: useBreakpoints,
      ),
    );
  }

  static TextStyle bold24(
    BuildContext context, {
    double? lowerLimitRatio,
    double? upperLimitRatio,
    bool useBreakpoints = false,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: _getResponsiveText(
        context,
        baseFontSize: 24,
        lowerLimitRatio: lowerLimitRatio,
        upperLimitRatio: upperLimitRatio,
        useBreakpoints: useBreakpoints,
      ),
    );
  }

  static TextStyle black20(
    BuildContext context, {
    double? lowerLimitRatio,
    double? upperLimitRatio,
    bool useBreakpoints = false,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: _getResponsiveText(
        context,
        baseFontSize: 20,
        lowerLimitRatio: lowerLimitRatio,
        upperLimitRatio: upperLimitRatio,
        useBreakpoints: useBreakpoints,
      ),
    );
  }

  // Font size 22
  static TextStyle bold22(
    BuildContext context, {
    double? lowerLimitRatio,
    double? upperLimitRatio,
    bool useBreakpoints = false,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: _getResponsiveText(
        context,
        baseFontSize: 22,
        lowerLimitRatio: lowerLimitRatio,
        upperLimitRatio: upperLimitRatio,
        useBreakpoints: useBreakpoints,
      ),
    );
  }

  static TextStyle medium22(
    BuildContext context, {
    double? lowerLimitRatio,
    double? upperLimitRatio,
    bool useBreakpoints = false,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: _getResponsiveText(
        context,
        baseFontSize: 22,
        lowerLimitRatio: lowerLimitRatio,
        upperLimitRatio: upperLimitRatio,
        useBreakpoints: useBreakpoints,
      ),
    );
  }

  static TextStyle bold36(
    BuildContext context, {
    double? lowerLimitRatio,
    double? upperLimitRatio,
    bool useBreakpoints = false,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: _getResponsiveText(
        context,
        baseFontSize: 36,
        lowerLimitRatio: lowerLimitRatio,
        upperLimitRatio: upperLimitRatio,
        useBreakpoints: useBreakpoints,
      ),
    );
  }

  static TextStyle medium32(
    BuildContext context, {
    double? lowerLimitRatio,
    double? upperLimitRatio,
    bool useBreakpoints = false,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: _getResponsiveText(
        context,
        baseFontSize: 32,
        lowerLimitRatio: lowerLimitRatio,
        upperLimitRatio: upperLimitRatio,
        useBreakpoints: useBreakpoints,
      ),
    );
  }

  // Font size 20
  static TextStyle medium20(
    BuildContext context, {
    double? lowerLimitRatio,
    double? upperLimitRatio,
    bool useBreakpoints = false,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: _getResponsiveText(
        context,
        baseFontSize: 20,
        lowerLimitRatio: lowerLimitRatio,
        upperLimitRatio: upperLimitRatio,
        useBreakpoints: useBreakpoints,
      ),
    );
  }

  static TextStyle bold28(
    BuildContext context, {
    double? lowerLimitRatio,
    double? upperLimitRatio,
    bool useBreakpoints = false,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: _getResponsiveText(
        context,
        baseFontSize: 28,
        lowerLimitRatio: lowerLimitRatio,
        upperLimitRatio: upperLimitRatio,
        useBreakpoints: useBreakpoints,
      ),
    );
  }

  static TextStyle black28(
    BuildContext context, {
    double? lowerLimitRatio,
    double? upperLimitRatio,
    bool useBreakpoints = false,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: _getResponsiveText(
        context,
        baseFontSize: 28,
        lowerLimitRatio: lowerLimitRatio,
        upperLimitRatio: upperLimitRatio,
        useBreakpoints: useBreakpoints,
      ),
    );
  }

  static TextStyle extraBold28(
    BuildContext context, {
    double? lowerLimitRatio,
    double? upperLimitRatio,
    bool useBreakpoints = false,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: _getResponsiveText(
        context,
        baseFontSize: 28,
        lowerLimitRatio: lowerLimitRatio,
        upperLimitRatio: upperLimitRatio,
        useBreakpoints: useBreakpoints,
      ),
    );
  }

  static TextStyle medium28(
    BuildContext context, {
    double? lowerLimitRatio,
    double? upperLimitRatio,
    bool useBreakpoints = false,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: _getResponsiveText(
        context,
        baseFontSize: 28,
        lowerLimitRatio: lowerLimitRatio,
        upperLimitRatio: upperLimitRatio,
        useBreakpoints: useBreakpoints,
      ),
    );
  }

  // Font size 18
  static TextStyle bold18(
    BuildContext context, {
    double? lowerLimitRatio,
    double? upperLimitRatio,
    bool useBreakpoints = false,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: _getResponsiveText(
        context,
        baseFontSize: 18,
        lowerLimitRatio: lowerLimitRatio,
        upperLimitRatio: upperLimitRatio,
        useBreakpoints: useBreakpoints,
      ),
    );
  }

  static TextStyle regular18(
    BuildContext context, {
    double? lowerLimitRatio,
    double? upperLimitRatio,
    bool useBreakpoints = false,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: _getResponsiveText(
        context,
        baseFontSize: 18,
        lowerLimitRatio: lowerLimitRatio,
        upperLimitRatio: upperLimitRatio,
        useBreakpoints: useBreakpoints,
      ),
    );
  }

  static TextStyle regular24(
    BuildContext context, {
    double? lowerLimitRatio,
    double? upperLimitRatio,
    bool useBreakpoints = false,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: _getResponsiveText(
        context,
        baseFontSize: 24,
        lowerLimitRatio: lowerLimitRatio,
        upperLimitRatio: upperLimitRatio,
        useBreakpoints: useBreakpoints,
      ),
    );
  }

  static TextStyle medium24(
    BuildContext context, {
    double? lowerLimitRatio,
    double? upperLimitRatio,
    bool useBreakpoints = false,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: _getResponsiveText(
        context,
        baseFontSize: 24,
        lowerLimitRatio: lowerLimitRatio,
        upperLimitRatio: upperLimitRatio,
        useBreakpoints: useBreakpoints,
      ),
    );
  }

  static TextStyle medium18(
    BuildContext context, {
    double? lowerLimitRatio,
    double? upperLimitRatio,
    bool useBreakpoints = false,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: _getResponsiveText(
        context,
        baseFontSize: 18,
        lowerLimitRatio: lowerLimitRatio,
        upperLimitRatio: upperLimitRatio,
        useBreakpoints: useBreakpoints,
      ),
    );
  }

  static TextStyle semiBold18(
    BuildContext context, {
    double? lowerLimitRatio,
    double? upperLimitRatio,
    bool useBreakpoints = false,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: _getResponsiveText(
        context,
        baseFontSize: 18,
        lowerLimitRatio: lowerLimitRatio,
        upperLimitRatio: upperLimitRatio,
        useBreakpoints: useBreakpoints,
      ),
    );
  }

  // Font size 16
  static TextStyle bold16(
    BuildContext context, {
    double? lowerLimitRatio,
    double? upperLimitRatio,
    bool useBreakpoints = false,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: _getResponsiveText(
        context,
        baseFontSize: 16,
        lowerLimitRatio: lowerLimitRatio,
        upperLimitRatio: upperLimitRatio,
        useBreakpoints: useBreakpoints,
      ),
    );
  }

  static TextStyle medium16(
    BuildContext context, {
    double? lowerLimitRatio,
    double? upperLimitRatio,
    bool useBreakpoints = false,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: _getResponsiveText(
        context,
        baseFontSize: 16,
        lowerLimitRatio: lowerLimitRatio,
        upperLimitRatio: upperLimitRatio,
        useBreakpoints: useBreakpoints,
      ),
    );
  }

  static TextStyle regular16(
    BuildContext context, {
    double? lowerLimitRatio,
    double? upperLimitRatio,
    bool useBreakpoints = false,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: _getResponsiveText(
        context,
        baseFontSize: 16,
        lowerLimitRatio: lowerLimitRatio,
        upperLimitRatio: upperLimitRatio,
        useBreakpoints: useBreakpoints,
      ),
    );
  }

  static TextStyle semiBold16(
    BuildContext context, {
    double? lowerLimitRatio,
    double? upperLimitRatio,
    bool useBreakpoints = false,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: _getResponsiveText(
        context,
        baseFontSize: 16,
        lowerLimitRatio: lowerLimitRatio,
        upperLimitRatio: upperLimitRatio,
        useBreakpoints: useBreakpoints,
      ),
    );
  }

  // Font size 14
  static TextStyle regular14(
    BuildContext context, {
    double? lowerLimitRatio,
    double? upperLimitRatio,
    bool useBreakpoints = false,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: _getResponsiveText(
        context,
        baseFontSize: 14,
        lowerLimitRatio: lowerLimitRatio,
        upperLimitRatio: upperLimitRatio,
        useBreakpoints: useBreakpoints,
      ),
    );
  }

  static TextStyle medium14(
    BuildContext context, {
    double? lowerLimitRatio,
    double? upperLimitRatio,
    bool useBreakpoints = false,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: _getResponsiveText(
        context,
        baseFontSize: 14,
        lowerLimitRatio: lowerLimitRatio,
        upperLimitRatio: upperLimitRatio,
        useBreakpoints: useBreakpoints,
      ),
    );
  }

  static TextStyle bold14(
    BuildContext context, {
    double? lowerLimitRatio,
    double? upperLimitRatio,
    bool useBreakpoints = false,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: _getResponsiveText(
        context,
        baseFontSize: 14,
        lowerLimitRatio: lowerLimitRatio,
        upperLimitRatio: upperLimitRatio,
        useBreakpoints: useBreakpoints,
      ),
    );
  }

  static TextStyle semiBold14(
    BuildContext context, {
    double? lowerLimitRatio,
    double? upperLimitRatio,
    bool useBreakpoints = false,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: _getResponsiveText(
        context,
        baseFontSize: 14,
        lowerLimitRatio: lowerLimitRatio,
        upperLimitRatio: upperLimitRatio,
        useBreakpoints: useBreakpoints,
      ),
    );
  }

  static TextStyle bold13(
    BuildContext context, {
    double? lowerLimitRatio,
    double? upperLimitRatio,
    bool useBreakpoints = false,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: _getResponsiveText(
        context,
        baseFontSize: 13,
        lowerLimitRatio: lowerLimitRatio,
        upperLimitRatio: upperLimitRatio,
        useBreakpoints: useBreakpoints,
      ),
    );
  }

  // Font size 13
  static TextStyle regular13(
    BuildContext context, {
    double? lowerLimitRatio,
    double? upperLimitRatio,
    bool useBreakpoints = false,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: _getResponsiveText(
        context,
        baseFontSize: 13,
        lowerLimitRatio: lowerLimitRatio,
        upperLimitRatio: upperLimitRatio,
        useBreakpoints: useBreakpoints,
      ),
    );
  }

  static TextStyle medium13(
    BuildContext context, {
    double? lowerLimitRatio,
    double? upperLimitRatio,
    bool useBreakpoints = false,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: _getResponsiveText(
        context,
        baseFontSize: 13,
        lowerLimitRatio: lowerLimitRatio,
        upperLimitRatio: upperLimitRatio,
        useBreakpoints: useBreakpoints,
      ),
    );
  }

  // Font size 12
  static TextStyle regular12(
    BuildContext context, {
    double? lowerLimitRatio,
    double? upperLimitRatio,
    bool useBreakpoints = false,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: _getResponsiveText(
        context,
        baseFontSize: 12,
        lowerLimitRatio: lowerLimitRatio,
        upperLimitRatio: upperLimitRatio,
        useBreakpoints: useBreakpoints,
      ),
    );
  }

  static TextStyle medium12(
    BuildContext context, {
    double? lowerLimitRatio,
    double? upperLimitRatio,
    bool useBreakpoints = false,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: _getResponsiveText(
        context,
        baseFontSize: 12,
        lowerLimitRatio: lowerLimitRatio,
        upperLimitRatio: upperLimitRatio,
        useBreakpoints: useBreakpoints,
      ),
    );
  }

  // Font size 10
  static TextStyle regular10(
    BuildContext context, {
    double? lowerLimitRatio,
    double? upperLimitRatio,
    bool useBreakpoints = false,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: _getResponsiveText(
        context,
        baseFontSize: 10,
        lowerLimitRatio: lowerLimitRatio,
        upperLimitRatio: upperLimitRatio,
        useBreakpoints: useBreakpoints,
      ),
    );
  }

  static TextStyle medium10(
    BuildContext context, {
    double? lowerLimitRatio,
    double? upperLimitRatio,
    bool useBreakpoints = false,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: _getResponsiveText(
        context,
        baseFontSize: 10,
        lowerLimitRatio: lowerLimitRatio,
        upperLimitRatio: upperLimitRatio,
        useBreakpoints: useBreakpoints,
      ),
    );
  }

  static TextStyle semiBold10(
    BuildContext context, {
    double? lowerLimitRatio,
    double? upperLimitRatio,
    bool useBreakpoints = false,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: _getResponsiveText(
        context,
        baseFontSize: 10,
        lowerLimitRatio: lowerLimitRatio,
        upperLimitRatio: upperLimitRatio,
        useBreakpoints: useBreakpoints,
      ),
    );
  }

  static TextStyle textStyleSemiBold34(
    BuildContext context, {
    double? lowerLimitRatio,
    double? upperLimitRatio,
    bool useBreakpoints = false,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: _getResponsiveText(
        context,
        baseFontSize: 34,
        lowerLimitRatio: lowerLimitRatio,
        upperLimitRatio: upperLimitRatio,
        useBreakpoints: useBreakpoints,
      ),
    );
  }

  static TextStyle textStyleSemiBold20(
    BuildContext context, {
    double? lowerLimitRatio,
    double? upperLimitRatio,
    bool useBreakpoints = false,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: _getResponsiveText(
        context,
        baseFontSize: 20,
        lowerLimitRatio: lowerLimitRatio,
        upperLimitRatio: upperLimitRatio,
        useBreakpoints: useBreakpoints,
      ),
    );
  }

  static TextStyle textStyleSemiBold15(
    BuildContext context, {
    double? lowerLimitRatio,
    double? upperLimitRatio,
    bool useBreakpoints = false,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: _getResponsiveText(
        context,
        baseFontSize: 15,
        lowerLimitRatio: lowerLimitRatio,
        upperLimitRatio: upperLimitRatio,
        useBreakpoints: useBreakpoints,
      ),
    );
  }

  static TextStyle textStyleAwesomeDialogTitle(
    BuildContext context, {
    double? lowerLimitRatio,
    double? upperLimitRatio,
    bool useBreakpoints = false,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: _getResponsiveText(
        context,
        baseFontSize: 20,
        lowerLimitRatio: lowerLimitRatio,
        upperLimitRatio: upperLimitRatio,
        useBreakpoints: useBreakpoints,
      ),
      color: context.mainTextColor,
    );
  }

  static TextStyle textStyleAwesomeDialogDesc(
    BuildContext context, {
    double? lowerLimitRatio,
    double? upperLimitRatio,
    bool useBreakpoints = false,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: _getResponsiveText(
        context,
        baseFontSize: 14,
        lowerLimitRatio: lowerLimitRatio,
        upperLimitRatio: upperLimitRatio,
        useBreakpoints: useBreakpoints,
      ),
      color: context.mainTextColor,
    );
  }

  static double _getResponsiveText(
    BuildContext context, {
    required double baseFontSize,
    double? lowerLimitRatio,
    double? upperLimitRatio,
    bool useBreakpoints = false,
  }) {
    return SmartScaler.scale(
      baseFontSize,
      context,
      useBreakpoints: useBreakpoints,
      lowerLimitRatio: lowerLimitRatio,
      upperLimitRatio: upperLimitRatio,
    );
  }
}
