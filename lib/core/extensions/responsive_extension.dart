import 'package:flutter/material.dart';
import 'package:marketi/core/utils/responsive_helper.dart';

extension ResponsiveExtension on num {
  double w(
    BuildContext context, {
    bool useBreakpoints = false,
    double? lowerLimitRatio,
    double? upperLimitRatio,
  }) => ResponsiveHelper.w(
    toDouble(),
    context,
    useBreakpoints: useBreakpoints,
    lowerLimitRatio: lowerLimitRatio,
    upperLimitRatio: upperLimitRatio,
  );
  double h(
    BuildContext context, {
    bool useBreakpoints = false,
    double? lowerLimitRatio,
    double? upperLimitRatio,
  }) => ResponsiveHelper.h(
    toDouble(),
    context,
    useBreakpoints: useBreakpoints,
    lowerLimitRatio: lowerLimitRatio,
    upperLimitRatio: upperLimitRatio,
  );
  double r(
    BuildContext context, {
    bool useBreakpoints = false,
    double? lowerLimitRatio,
    double? upperLimitRatio,
  }) => ResponsiveHelper.r(
    toDouble(),
    context,
    useBreakpoints: useBreakpoints,
    lowerLimitRatio: lowerLimitRatio,
    upperLimitRatio: upperLimitRatio,
  );
}
