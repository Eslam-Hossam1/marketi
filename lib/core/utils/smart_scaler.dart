import 'package:flutter/material.dart';

/// =============================================================
/// Smart Responsive System
/// =============================================================

class SmartScaler {
  SmartScaler._();

  static late double _deviceWidth;
  static late double _deviceHeight;
  static late Orientation _orientation;

  // Design Sizes
  static const double _mobileDesignWidth = 375;
  static const double _tabletDesignWidth = 800;
  static const double _desktopDesignWidth = 1200;

  // Breakpoints
  static const double mobileMax = 500;
  static const double tabletMax = 1200;

  static void init(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    // If shortest side is less than mobileMax, it's a mobile device
    if (size.shortestSide < mobileMax) {
      // Mobile: always use min dimension for width to scale consistently
      _deviceWidth = size.shortestSide;
      _deviceHeight = size.longestSide;
    } else {
      // Tablet/Desktop: use actual width for adaptive scaling
      _deviceWidth = size.width;
      _deviceHeight = size.height;
    }
  }

  // -------------------------------------------------------------
  // DEVICE TYPE
  // -------------------------------------------------------------

  static bool get isMobile => _deviceWidth < mobileMax;
  static bool get isTablet =>
      _deviceWidth >= mobileMax && _deviceWidth < tabletMax;
  static bool get isDesktop => _deviceWidth >= tabletMax;

  // -------------------------------------------------------------
  // ORIENTATION
  // -------------------------------------------------------------

  static bool get isPortrait => _orientation == Orientation.portrait;
  static bool get isLandscape => _orientation == Orientation.landscape;

  // -------------------------------------------------------------
  // DEVICE TYPE + ORIENTATION
  // -------------------------------------------------------------

  static bool get isMobilePortrait => isMobile && isPortrait;
  static bool get isMobileLandscape => isMobile && isLandscape;
  static bool get isTabletPortrait => isTablet && isPortrait;
  static bool get isTabletLandscape => isTablet && isLandscape;

  // -------------------------------------------------------------
  // SCALE CORE
  // -------------------------------------------------------------

  static double scale(
    double size,
    BuildContext context, {
    bool useBreakpoints = false,
    double? lowerLimitRatio,
    double? upperLimitRatio,
  }) {
    init(context);
    // Scale MODE (NO BREAKPOINTS)
    if (!useBreakpoints) {
      final scale = _deviceWidth / _mobileDesignWidth;
      return size *
          scale.clamp(lowerLimitRatio ?? 0.75, upperLimitRatio ?? 1.5);
    }

    // Adaptive MODE (WITH BREAKPOINT RESET)
    double baseWidth;

    if (isMobile) {
      baseWidth = _mobileDesignWidth;
    } else if (isTablet) {
      baseWidth = _tabletDesignWidth;
    } else {
      baseWidth = _desktopDesignWidth;
    }

    final scale = _deviceWidth / baseWidth;
    return size * scale.clamp(lowerLimitRatio ?? 0.75, upperLimitRatio ?? 1.5);
  }

  // -------------------------------------------------------------
  // PUBLIC API
  // -------------------------------------------------------------

  static double w(
    double value,
    BuildContext context, {
    bool useBreakpoints = false,

    double? lowerLimitRatio,
    double? upperLimitRatio,
  }) => scale(
    value,
    context,
    useBreakpoints: useBreakpoints,
    lowerLimitRatio: lowerLimitRatio,
    upperLimitRatio: upperLimitRatio,
  );
  static double h(
    double value,
    BuildContext context, {
    bool useBreakpoints = false,
    double? lowerLimitRatio,
    double? upperLimitRatio,
  }) => scale(
    value,
    context,
    useBreakpoints: useBreakpoints,
    lowerLimitRatio: lowerLimitRatio,
    upperLimitRatio: upperLimitRatio,
  );
  static double r(
    double value,
    BuildContext context, {
    bool useBreakpoints = false,
    double? lowerLimitRatio,
    double? upperLimitRatio,
  }) => scale(
    value,
    context,
    useBreakpoints: useBreakpoints,
    lowerLimitRatio: lowerLimitRatio,
    upperLimitRatio: upperLimitRatio,
  );
}
